import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/models/activity.dart';
import 'package:mental_health_flutter_app/models/article_model.dart';
import 'package:mental_health_flutter_app/models/completed_activity.dart';
import 'package:mental_health_flutter_app/models/question_model.dart';
import 'package:mental_health_flutter_app/models/quote_model.dart';
import 'package:mental_health_flutter_app/screens/home_screen.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'db_connection/db_connect.dart';
import 'models/emergency_contact_model.dart';
import 'models/mood_model.dart';
import 'services/notificationservice.dart';




void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    WidgetsFlutterBinding.ensureInitialized();

    NotificationService().initNotification();

    tz.initializeTimeZones();
    NotificationService().showNotification(
        1, 'Daily mood', 'It is time for you to enter your daily mood');
    return Future.value(true);
  });
}

@override
void initState() {
  Workmanager().registerPeriodicTask('uniqueName', 'taskName',
      frequency: const Duration(minutes: 1));
  initState();
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher);

  var db = DBconnect();
  // db.addMood(
  //   Mood(id:'1',mood:'Question 2 example', datetime:''),
  // );
  // db.addActivity(
  //   Activity(id:'1',title:'Question 2 example', moodCategory:1),
  // );

  //   db.addArticle(
  //   Article(id:'1',title:'Question 2 example', content:'',imageUrl: ''),
  // );
  //     db.addContact(
  //   ContactSettings(id:'1',phone:'Question 2 example', email:''),
  // );

  //     db.addQuote(
  //   Quote(id:'1',content:'Question 2 example', author:''),
  // );
  //       db.addAnxietyQuestion(
  //   Question(id:'1',title:'Question 2 example', options:{}),
  // );

  //       db.addDepressionQuestion(
  //   Question(id:'1',title:'Question 2 example', options:{}),
  // );
  //       db.addImposterSyndromeQuestion(
  //   Question(id:'1',title:'Question 2 example', options:{}),
  // );
  //         db.addOCDQuestion(
  //   Question(id:'1',title:'Question 2 example', options:{}),
  // );


  //         db.addCompletedActivity(
  //   CompletedActivity(id:'1',title:'bla bla', isCompleted:'bla bla'),
  // );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}


