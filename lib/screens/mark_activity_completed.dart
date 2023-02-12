import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/screens/home_screen.dart';
import 'package:mental_health_flutter_app/screens/my_activities_screen.dart';
import '../constants.dart';
import '../models/db_connect.dart';




// class ActivityCompletitionScreen extends StatelessWidget {
//   const ActivityCompletitionScreen({super.key});



class ActivityCompletitionScreen extends StatefulWidget {
 const ActivityCompletitionScreen({Key? key,
   required this.activityId,
    required this.title,
  }) : super(key:key);

   final String activityId;
   final String title;

  @override
  _ActivityCompletitionScreenState createState() => _ActivityCompletitionScreenState(activityId: activityId,title:title);
}

class _ActivityCompletitionScreenState extends State<ActivityCompletitionScreen> {

    String activityId;
    String title;

  //_ActivityScreenState();
  _ActivityCompletitionScreenState({
  required this.activityId,
  required this.title,
  });

 var db = DBconnect();

void onPressed(){
  //db.updateCompletedActivtiy(activityId: activityId);
  db.updateCompletedActivtiy(activityId,title);
  // db.addCompletedActivity(CompletedActivity(id: '3', title: title, isCompleted: 'false'));
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const MyActivitiesScreen()));
}





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity completition'),
        backgroundColor: background,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 40.0, right: 20.0),
              child: Text(
                'Once you are done with the activity, mark it as completed.',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              width: 200,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: background, width: 2),
                  ),
                  onPressed: onPressed,
                  child:  const Text(
                    "Completed",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 100,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: background, width: 2),
                  ),
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}