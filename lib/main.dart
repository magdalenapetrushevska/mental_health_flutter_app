import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/models/activity.dart';
import 'package:mental_health_flutter_app/models/article_model.dart';
import 'package:mental_health_flutter_app/screens/home_screen.dart';
//import 'models/question_model.dart';
import './models/db_connect.dart';
import 'models/quote_model.dart';
//import 'models/quote_model.dart';
void main() {
   var db = DBconnect();

  db.addActivity(
    Activity(
        id: '1',
        title: 'Do new hairstyle',
        moodCategory: 1,
),
  );

    db.addActivity(
    Activity(
        id: '2',
        title: 'Download an audiobook',
        moodCategory: 2,
),
  );

    db.addActivity(
    Activity(
        id: '3',
        title: 'Listen to a podcast',
        moodCategory: 3,
),
  );

    db.addActivity(
    Activity(
        id: '4',
        title: 'Try a coloring app',
        moodCategory: 1,
),
  );

    db.addActivity(
    Activity(
        id: '5',
        title: 'Paint a picture',
        moodCategory: 2,
),
  );

      db.addActivity(
    Activity(
        id: '5',
        title: 'Make a custom photo book',
        moodCategory: 3,
),
  );

      db.addActivity(
    Activity(
        id: '6',
        title: 'Change up your décor',
        moodCategory: 1,
),
  );


      db.addActivity(
    Activity(
        id: '7',
        title: 'Make some wall art',
        moodCategory: 2,
),
  );

      db.addActivity(
    Activity(
        id: '8',
        title: 'Whip up a new recipe',
        moodCategory: 3,
),
  );



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),
    );
  }
}