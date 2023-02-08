import 'package:flutter/material.dart';
import './screens/home_screen.dart';
//import './models/db_connect.dart';
void main() {
  //var db = DBconnect();
  // db.addQuestion(
  //   Question(id:'3',title:'Worrying too much about different things', options:{
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