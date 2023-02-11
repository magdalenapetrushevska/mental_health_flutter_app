import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mental_health_flutter_app/models/mood_model.dart';
import '../constants.dart';
import '../models/db_connect.dart';
import 'activities_screen.dart';
import 'example_testing_screen.dart';

class RateMoodScreen extends StatefulWidget {
  const RateMoodScreen({Key? key,
  }) : super(key:key);


  @override
  _RateMoodScreenState createState() => _RateMoodScreenState();
}

class _RateMoodScreenState extends State<RateMoodScreen> {
    int moodCategory = 0;
    var now = DateTime.now();
    var formatter =  DateFormat('yyyy-MM-dd');
    String formattedDate ='';

  _RateMoodScreenState();
  var db = DBconnect();

  Future<void> addMood(String mood) async {
    db.addMood(Mood(
        id: '1',
        mood: mood,
        datetime: DateFormat('dd-MM-yyyy').format(DateTime.now())));

    if(mood =='great' || mood == 'good'){
          moodCategory = 1;
    }
    else if(mood =='bad' || mood == 'awful'){
          moodCategory = 2;
    } else{
      moodCategory = 3;
    }

    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ActivityScreen(moodCategory: moodCategory)));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate your mood'),
        backgroundColor: background,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Image.asset('assets/images/smile.png'), // <-- SEE HERE
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton.extended(
                      heroTag: null,
                      onPressed: () {
                        addMood('great');
                      },
                      label: const Text("Great"),
                      backgroundColor: background,
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {
                          addMood('good');
                      },
                      label: const Text("Good"),
                      backgroundColor: background,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton.extended(
                      heroTag: null,
                      onPressed: () {
                        addMood('okay');
                      },
                      label: const Text("Okay"),
                      backgroundColor: background,
                    ),
                    FloatingActionButton.extended(
                      heroTag: null,
                     onPressed: () {
                        addMood('bad');
                     },
                      label: const Text("Bad"),
                      backgroundColor: background,
                    ),
                    FloatingActionButton.extended(
                      heroTag: null,
                      onPressed: () {
                        addMood('awful');
                      },
                      label: const Text("Awful"),
                      backgroundColor: background,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
