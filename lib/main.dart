import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/models/emergency_contact_model.dart';
import 'package:mental_health_flutter_app/screens/home_screen.dart';
import 'db_connection/db_connect.dart';
import 'package:workmanager/workmanager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'services/notificationservice.dart';


void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    // your code that you want to run in background
    // print('#' * 200);
    // print('Executing task');
    // Future.delayed(Duration(seconds: 4));
    // print('Task executed: ' + taskName);
    // return Future.value(true);
    WidgetsFlutterBinding.ensureInitialized();

// to initialize the notificationservice.
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
        frequency: Duration());
    initState();
  }



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher);
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