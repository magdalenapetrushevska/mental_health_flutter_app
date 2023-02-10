import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';



//class ExampleTestingScreen extends StatefulWidget {


class ExampleTestingScreen extends StatelessWidget {
  const ExampleTestingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
      return <Widget>[
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            title: const Text('Snapping Nested SliverAppBar'),
            floating: true,
            snap: true,
            expandedHeight: 200.0,
            forceElevated: innerBoxIsScrolled,
          ),
        ),
      ];
    }, body: Builder(builder: (BuildContext context) {
      return CustomScrollView(
        // The "controller" and "primary" members should be left unset, so that
        // the NestedScrollView can control this inner scroll view.
        // If the "controller" property is set, then this scroll view will not
        // be associated with the NestedScrollView.
        slivers: <Widget>[
          SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
          SliverFixedExtentList(
            itemExtent: 48.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) =>
                  ListTile(title: Text('Item $index')),
              childCount: 30,
            ),
          ),
        ],
      );
    })));
  }
}
