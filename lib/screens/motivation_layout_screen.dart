import 'package:flutter/material.dart';
import 'favorites_screen.dart';
import 'motivation_screen.dart';

class MotivationLayoutScreen extends StatefulWidget {
  const MotivationLayoutScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MotivationLayoutScreenState createState() => _MotivationLayoutScreenState();
}

class _MotivationLayoutScreenState extends State<MotivationLayoutScreen> {
  _MotivationLayoutScreenState();

  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const MotivationScreen();
        break;
      case 1:
        page = const FavoritesScreen();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('New quotes'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ],
        ),
      );
    });
  }
}
