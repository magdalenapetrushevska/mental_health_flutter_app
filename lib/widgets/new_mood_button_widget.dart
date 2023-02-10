import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/screens/rate_mood_screen.dart';
import '../constants.dart';

class NewMoodButtonWidget extends StatelessWidget{
  const NewMoodButtonWidget({Key? key,}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return  Column(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: background,
                          ),
                          child: const Text(
                            "Add new mood",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RateMoodScreen()));
                          },
                        ),
                      ),
                    ),
                  ],
                );
  }
}