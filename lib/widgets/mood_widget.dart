import 'package:flutter/material.dart';

class MoodWidget extends StatelessWidget {
  const MoodWidget({
    Key? key,
    required this.mood,
    required this.datetime,
  }) : super(key: key);

  final String mood;
  final String datetime;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        if (mood == 'awful')
                                          Image.asset(
                                              'assets/images/feeling_awful.png',
                                              width: 53,
                                              height: 58),
                                        if (mood == 'bad')
                                          Image.asset(
                                              'assets/images/feeling_bad.png',
                                              width: 53,
                                              height: 58),
                                        if (mood == 'okay')
                                          Image.asset(
                                              'assets/images/feeling_okay.png',
                                              width: 53,
                                              height: 58),
                                        if (mood == 'good')
                                          Image.asset(
                                              'assets/images/feeling_good.png',
                                              width: 53,
                                              height: 58),
                                        if (mood == 'great')
                                          Image.asset(
                                              'assets/images/feeling_great.png',
                                              width: 53,
                                              height: 58),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("Feeling"),
                                        Text(
                                          mood,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text(datetime),
                                      ],
                                    ),
                                  ],
                                ),
                                const Divider(
                                  color: Colors.black,
                                  height: 25,
                                  thickness: 2,
                                  indent: 25,
                                  endIndent: 25,
                                ),
                              ],
                            ),
                          ]),
    );
  }
}
