import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/screens/home_screen.dart';
//import 'models/question_model.dart';
//import './models/db_connect.dart';
//import 'models/quote_model.dart';
void main() {
   //var db = DBconnect();
  // db.addQuestion(
  //   Question(id:'1',title:'How often do you ever experience unwanted repetitive and persistent thoughts that cause you anxiety?', options:{
  //     'Not at all':0,
  //     'Several days':1,
  //     'Nearly every day':2,}),
  // );

  // db.addQuote(
  //   Quote(
  //     id:'1',
  //     content:'Stress is self-created, I decided to stop manufacturing it. We can choose an internal calm and joy even amid the chaos.', 
  //     author:'Brendon Burchard'),
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