import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/screens/mood_history_screen.dart';
import 'package:mental_health_flutter_app/screens/my_activities_screen.dart';
import 'package:mental_health_flutter_app/screens/rate_mood_screen.dart';
import 'package:mental_health_flutter_app/screens/test_category_screen.dart';
import '../constants.dart';
import '../db_connection/db_connect.dart';
import 'articles_screen.dart';
import 'motivation_layout_screen.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

// class HomeScreen extends StatelessWidget {
//    HomeScreen({super.key});

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

 String location ='Null, Press Button';
  String Address = 'search';


 var db = DBconnect();


  @override
  void initState(){
    super.initState();
  }




  Future<void> initLocation() async{
    Position position = await  _getGeoLocationPosition();
              location ='Lat: ${position.latitude} , Long: ${position.longitude}';
              GetAddressFromLatLong(position);
  }


Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(()  {
    });
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
    await GetAddressFromLatLong(position).then((result){
    sending_SMS(
        'This is a mental health emergency message.\n The person that sends this message requires your help. \n\n Location: $Address' ,
        [
          '123456789',
        ]);
    });
  }



  @override
  Widget build(BuildContext context) {
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
                Padding(
                  padding: const EdgeInsets.all(.0),
                  child: Column(
                    children: [
                      FloatingActionButton(
                        onPressed: onPressed,
                        tooltip: 'Send SMS',
                        child: const Icon(Icons.local_hospital),
                      ),
                    ],
                ),
                    ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 160,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 8.0, top: 8.0, bottom: 2.5),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(),
                          child: const Text(
                            "Mood history",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MoodHistoryScreen()));
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            right: 8.0, left: 8.0, bottom: 8.0, top: 2.5),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(),
                          child: const Text(
                            "My activities",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>const  MyActivitiesScreen()));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/avatar.jpg'),
                          ),
                          Text("Magdalena"),
                          Text("Petrushevska"),
                        ],
                      ),
                    ),
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
                      "Activities",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon:
                          Image.asset('assets/images/home_page_activities.png'),
                      iconSize: 150,
                      onPressed: () {
                        Navigator.push(context,
      MaterialPageRoute(builder: (context) => RateMoodScreen()));
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Tests",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/home_page_tests.png'),
                      iconSize: 150,
                      onPressed: () {
                          Navigator.push(context,
      MaterialPageRoute(builder: (context) => TestCategoryScreen()));
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon:
                          Image.asset('assets/images/home_page_motivation.png'),
                      iconSize: 150,
                      onPressed: () {
                        //MotivationPage
                          Navigator.push(context,
      MaterialPageRoute(builder: (context) => const MotivationLayoutScreen()));
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Articles",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/home_page_articles.png'),
                      iconSize: 150,
                      onPressed: () {
                          Navigator.push(context,
      MaterialPageRoute(builder: (context) => const ArticlesScreen()));
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
}