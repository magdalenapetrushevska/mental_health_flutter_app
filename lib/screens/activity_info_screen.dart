import 'package:flutter/material.dart';
import '../constants.dart';
//class ActivityInfoScreen extends StatelessWidget {

  class ActivityInfoScreen extends StatefulWidget {
 const ActivityInfoScreen({Key? key,
   required this.title,
  }) : super(key:key);

   final String title;

  @override
  _ActivityInfoScreenState createState() => _ActivityInfoScreenState(title: title);
}

class _ActivityInfoScreenState extends State<ActivityInfoScreen> {

    var title;

  _ActivityInfoScreenState({
  required this.title
  });

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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Objectives",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Why this helps?",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Activity name",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(title),
            SizedBox(
              height: 70,
            ),
            SizedBox(
              width: 200,
              height: 65,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: background,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    "Accept challenge",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}