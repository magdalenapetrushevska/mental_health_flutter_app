import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/screens/home_screen.dart';
//import 'models/question_model.dart';
//import './models/db_connect.dart';
void main() {
  // var db = DBconnect();
  // db.addQuestion(
  //   Question(id:'1',title:'How often do you ever experience unwanted repetitive and persistent thoughts that cause you anxiety?', options:{
  //     'Not at all':0,
  //     'Several days':1,
  //     'Nearly every day':2,}),
  // );
  


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