import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/screens/rate_mood_screen.dart';
import '../constants.dart';
import '../db_connection/db_connect.dart';
import '../models/emergency_contact_model.dart';
import '../models/mood_model.dart';
import '../widgets/mood_widget.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class MoodHistoryScreen extends StatefulWidget {
  const MoodHistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MoodHistoryScreenState createState() => _MoodHistoryScreenState();
}

class _MoodHistoryScreenState extends State<MoodHistoryScreen> {
  _MoodHistoryScreenState();

  var db = DBconnect();
  String emailBodyContent = 'The following is the list of history mood:\n\n';

  String emailAddress = '';

  late Future _moods;

  late ContactSettings _contact;

  Future<List<Mood>> getData() async {
    return db.fetchMoods();
  }

    Future<List<ContactSettings>> getContact() async {
    return db.fetchContact();
  }

  generateEmailBodyContent() {}

  void sendEmail() async {
    final Email send_email = Email(
      body: emailBodyContent,
      subject: 'Mood history report',
      recipients: [emailAddress],
      isHTML: false,
    );

    await FlutterEmailSender.send(send_email);
  }

  @override
  void initState() {
    _moods = getData();
    db.fetchEmailContact();
    emailAddress = DBconnect.emailAddress;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _moods as Future<List<Mood>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Mood>;
            for (int i = 0; i < extractedData.length; i++) {
              emailBodyContent +=
                  'Date: ${extractedData[i].datetime}  Mood: ${extractedData[i].mood}';
              emailBodyContent += '\n';
            }
            return Scaffold(
                body: NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    title: const Text('Mood history'),
                    backgroundColor: background,
                    floating: true,
                    expandedHeight: 200.0,
                    forceElevated: innerBoxIsScrolled,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 60,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const RateMoodScreen()));
                            },
                            icon: const Icon(Icons.add),
                            label: const Text(''),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 60,
                          child: ElevatedButton.icon(
                            onPressed: sendEmail,
                            icon: const Icon(Icons.email),
                            label: const Text(''),
                          ),
                        ),
                      ),
                    ],
                  ),
                ];
              },
              body: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: extractedData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MoodWidget(
                      mood: extractedData[index].mood,
                      datetime: extractedData[index].datetime,
                    );
                  }),
            ));
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
