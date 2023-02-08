import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './models/db_connect.dart';
import './models/db_connect.dart';
void main() {
  var db = DBconnect();
  // db.addQuestion(
  //   Question(id:'1',title:'Question 2 example', options:{
  //     '500':true,
  //     '700':false,
  //     '900':false,
  //     '800':false}),
  // );
  db.fetchQuestions();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  HomeScreen(),  // we will create this in separate file
    );
  }
}