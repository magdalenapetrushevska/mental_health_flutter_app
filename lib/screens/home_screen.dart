import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/models/emergency_contact_model.dart';
import 'package:mental_health_flutter_app/screens/mood_history_screen.dart';
import 'package:mental_health_flutter_app/screens/my_activities_screen.dart';
import 'package:mental_health_flutter_app/screens/rate_mood_screen.dart';
import 'package:mental_health_flutter_app/screens/test_category_screen.dart';
import '../constants.dart';
import '../db_connection/db_connect.dart';
import '../widgets/contact_settings_widget.dart';
import 'articles_screen.dart';
import 'motivation_layout_screen.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String location = 'Null, Press Button';
  String address = 'search';
  String emergencyPhone = '';
  String psychotherapistEmail = '';
  String contactId = '';

  var db = DBconnect();

  late Future _contact;

  Future<List<ContactSettings>> getData() async {
    return db.fetchContact();
  }

  @override
  void initState() {
    _contact = getData();
    super.initState();
  }

  Future<void> initLocation() async {
    Position position = await _getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    getAddressFromLatLong(position);
  }

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> getAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    address =
        '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {});
  }

  void sending_SMS(String msg, List<String> list_receipents) async {
    String send_result =
        await sendSMS(message: msg, recipients: list_receipents)
            .catchError((err) {
      print(err);
    });
    print(send_result);
  }

  void onPressed() async {
    Position position = await _getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    await getAddressFromLatLong(position).then((result) {
      sending_SMS(
          'This is a mental health emergency message.\n The person that sends this message requires your help. \n\n Location: $address',
          [
            emergencyPhone,
          ]);
    });
  }

  void changeSettings() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => ContactSettingsBox(
              contactId: contactId,
              phone: emergencyPhone,
              email: psychotherapistEmail,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              },
            ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _contact as Future<List<ContactSettings>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<ContactSettings>;
            for (int i = 0; i < extractedData.length; i++) {
              contactId = extractedData[i].id;
              emergencyPhone = extractedData[i].phone;
              psychotherapistEmail = extractedData[i].email;
            }
            return Scaffold(
              appBar: AppBar(
                title: const Text('Home'),
                backgroundColor: background,
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MoodHistoryScreen()));
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30.0, vertical: 15.0),
                                  primary: Colors.deepPurpleAccent,
                                  shape: const StadiumBorder(),
                                ),
                                child: const Text(
                                  "Mood history",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyActivitiesScreen()));
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0, vertical: 15.0),
                                primary: Colors.deepPurpleAccent,
                                shape: const StadiumBorder(),
                              ),
                              child: const Text(
                                "My activities",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Column(
                              children: [
                                FloatingActionButton(
                                  heroTag: "btn1",
                                  backgroundColor: Colors.red,
                                  onPressed: onPressed,
                                  tooltip: 'Send SMS',
                                  child: const Icon(Icons.local_hospital),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  FloatingActionButton(
                                    heroTag: "btn2",
                                    onPressed: changeSettings,
                                    tooltip: 'Send SMS',
                                    child: const Icon(Icons.settings),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Activities",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            IconButton(
                              icon: Image.asset(
                                  'assets/images/activities_icon_final.png'),
                              iconSize: 150,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const RateMoodScreen()));
                              },
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Tests",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            IconButton(
                              icon: Image.asset(
                                  'assets/images/tests_icon_final.png'),
                              iconSize: 150,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TestCategoryScreen()));
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Motivation",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            IconButton(
                              icon: Image.asset(
                                  'assets/images/motivation_icon_final.png'),
                              iconSize: 150,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MotivationLayoutScreen()));
                              },
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Articles",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            IconButton(
                              icon: Image.asset(
                                  'assets/images/articles_icon_final.png'),
                              iconSize: 150,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ArticlesScreen()));
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const Center(
          child: Text('No data'),
        );
      },
    );
  }
}
