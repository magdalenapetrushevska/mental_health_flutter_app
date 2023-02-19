import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/screens/home_screen.dart';
import 'package:workmanager/workmanager.dart';
import 'package:timezone/data/latest.dart' as tz;
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
