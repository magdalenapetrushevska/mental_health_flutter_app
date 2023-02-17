import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/constants.dart';
import 'package:mental_health_flutter_app/screens/test_screen.dart';
class TestCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mental Health Tests'),
        backgroundColor:background,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Choose a category:",
              style: TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 250,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: background,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    "Anxiety Test",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
      MaterialPageRoute(builder: (context) => TestScreen(testCategory: 'anxiety',)));
                  },
                ),
              ),
            ),
            SizedBox(
              width: 250,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: background, width: 2),
                  ),
                  child: Text(
                    "Depression Test",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
      MaterialPageRoute(builder: (context) => TestScreen(testCategory: 'depression',)));
                  },
                ),
              ),
            ),
            SizedBox(
              width: 250,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: background, width: 2),
                  ),
                  child: Text(
                    "Imposter syndrome Test",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
      MaterialPageRoute(builder: (context) => TestScreen(testCategory: 'imposter',)));
                  },
                ),
              ),
            ),
            SizedBox(
              width: 250,
              height: 80,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: background, width: 2),
                  ),
                  child: Text(
                    "OCD Test",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(context,
      MaterialPageRoute(builder: (context) => TestScreen(testCategory: 'ocd',)));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
