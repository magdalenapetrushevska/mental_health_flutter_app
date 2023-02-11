import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/models/completed_activity.dart';
import 'package:mental_health_flutter_app/screens/example_testing_screen.dart';
import 'package:mental_health_flutter_app/screens/my_activities_screen.dart';
import '../constants.dart';
import '../models/db_connect.dart';
import 'mark_activity_completed.dart';
//class ActivityInfoScreen extends StatelessWidget {

  class ActivityInfoScreen extends StatefulWidget {
 const ActivityInfoScreen({Key? key,
 required this.activityId,
   required this.title,
  }) : super(key:key);

final String activityId;
final String title;
  

  @override
  _ActivityInfoScreenState createState() => _ActivityInfoScreenState(title: title,activityId:activityId);
}

class _ActivityInfoScreenState extends State<ActivityInfoScreen> {

    var title;
    var activityId;

  _ActivityInfoScreenState({
  required this.title,
  required this.activityId,
  });
  
  var db = DBconnect();

void onPressed(){
  db.addCompletedActivity(CompletedActivity(id: '3', title: title, isCompleted: 'false'));
  Navigator.push(context,
      MaterialPageRoute(builder: (context) =>  ActivityCompletitionScreen(activityId:activityId,title:title)));
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity info'),
        backgroundColor: background,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Objectives",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.only(
                  left: 30.0, top: 8.0, bottom: 15.0, right: 15),
              child: Text(
                  "Find quiet place. Do the chosen activity for the next half and hour."),
            ),
            const Divider(
              color: Colors.black,
              height: 25,
              thickness: 2,
              indent: 25,
              endIndent: 25,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Why this helps?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding:  EdgeInsets.only(
                  left: 30.0, top: 8.0, bottom: 15.0, right: 15),
              child: Text(
                  "This activity releases endorphins in your body. Endorphins are pleasure-inducing chemicals that reduce stress and anxiety."),
            ),
            const Divider(
              color: Colors.black,
              height: 25,
              thickness: 2,
              indent: 25,
              endIndent: 25,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Activity name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(title),
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              width: 200,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      color: background,
                      width: 2,
                    ),
                  ),
                  onPressed: onPressed,
                  child: const Text(
                    "Accept challenge",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}