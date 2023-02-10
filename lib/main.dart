import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/models/article_model.dart';
import 'package:mental_health_flutter_app/screens/home_screen.dart';
//import 'models/question_model.dart';
import './models/db_connect.dart';
import 'models/quote_model.dart';
//import 'models/quote_model.dart';
void main() {
   var db = DBconnect();

  // db.addArticle(
  //   Article(
  //       id: '1',
  //       title: 'How is mental health to be measured, and what does it mean to be truly healthy?',
  //       content: '‘It is no measure of health to be well-adjusted to a profoundly sick society’ is perhaps Krishnamurti’s best-known quote, shared widely across the internet. Although we cannot attribute these exact words to Krishnamurti, he made similar statements over the decades, and it is a theme he returned to repeatedly. So, if not in relation to society, how is health, specifically mental health, to be measured, and what does it mean to be truly healthy? As we shall see in this article, a specially selected collection of text and video extracts, Krishnamurti’s notion of mental health goes way beyond that of society’s, challenging the limited approach of analysts, psychologists and religions, revealing an unshakable order, harmony and sanity.',
  //       imageUrl: 'https://www.ucheck.co.uk/wp-content/uploads/mental-health-2313426_1280.png'),
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