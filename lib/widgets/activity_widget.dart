
import '../screens/activity_info_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ActivityWidget extends StatelessWidget{
  const ActivityWidget({Key? key, required this.activityId,required this.title,}): super(key:key);
  final String activityId;
  final String title;


@override
Widget build(BuildContext context){
  return SizedBox(
            width: 300,
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: background,
                ),
                child:  Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ActivityInfoScreen(activityId:activityId,title:title)));
                },
              ),
            ),
          );
}
}