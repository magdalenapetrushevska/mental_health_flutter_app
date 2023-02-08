import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/screens/test_category_screen.dart';
import 'package:mental_health_flutter_app/screens/test_screen.dart';
import '../constants.dart';

class HomeScreen extends StatelessWidget {
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
                    Column(
                  children: [
                    IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.question_mark),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TestCategoryScreen()));
                      },
                    ),
                  ],
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
                          child: Text(
                            "Mood history",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TestCategoryScreen()));
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
                          child: Text(
                            "Accomplishments",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TestCategoryScreen()));
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
                    Text(
                      "Activities",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon:
                          Image.asset('assets/images/home_page_activities.png'),
                      iconSize: 150,
                      onPressed: () {
                        //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RateYourMoodPage()));
                        Navigator.push(context,
      MaterialPageRoute(builder: (context) => TestCategoryScreen()));
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
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
                    Text(
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
      MaterialPageRoute(builder: (context) => TestCategoryScreen()));
                      },
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Articles",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      icon: Image.asset('assets/images/home_page_articles.png'),
                      iconSize: 150,
                      onPressed: () {
                          Navigator.push(context,
      MaterialPageRoute(builder: (context) => TestCategoryScreen()));
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