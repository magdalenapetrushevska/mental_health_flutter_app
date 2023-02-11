
import '../screens/activity_info_screen.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class ActivityWidget extends StatelessWidget{
  const ActivityWidget({Key? key, required this.title,}): super(key:key);
  final String title;


@override
Widget build(BuildContext context){
  return SizedBox(
            width: 130,
            height: 55,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: background,
                ),
                child:  Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ActivityInfoScreen(title:title)));
                },
              ),
            ),
          );
}
}