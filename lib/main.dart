import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/models/activity.dart';
import 'package:mental_health_flutter_app/models/article_model.dart';
import 'package:mental_health_flutter_app/screens/home_screen.dart';
//import 'models/question_model.dart';
import './models/db_connect.dart';
import 'models/mood_model.dart';
import 'models/quote_model.dart';
//import 'models/quote_model.dart';
void main() {
   var db = DBconnect();




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