import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/widgets/article_widget.dart';
import '../constants.dart';

class ArticlesScreen extends StatelessWidget {
  const ArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
            // Setting floatHeaderSlivers to true is required in order to float
            // the outer slivers over the inner scrollable.
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: const Text('Articles'),
                  backgroundColor: background,
                  floating: true,
                  expandedHeight: 100.0,
                  forceElevated: innerBoxIsScrolled,
                ),
              ];
            },
            body: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: 30,
                itemBuilder: (BuildContext context, int index) {
                  return ArticleWidget(
                    title: '',
                    content:'',
                    imageUrl: '',
                    //child: Center(child: Text('Item $index')),
                  );
                })));
  }
}

