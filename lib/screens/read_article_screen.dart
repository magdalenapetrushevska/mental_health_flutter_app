import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ReadArticleScreen extends StatefulWidget {
  const ReadArticleScreen({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  _ReadArticleScreenState createState() =>
      _ReadArticleScreenState(title: title, content: content);
}

class _ReadArticleScreenState extends State<ReadArticleScreen> {
  var title;
  var content;

  _ReadArticleScreenState({
    required this.title,
    required this.content,
  });

  final FlutterTts flutterTts = FlutterTts();


  void stopSpeaking() async{
      await flutterTts.stop();
  }

  void onPressed() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            title: Text(title),
            floating: true,
            expandedHeight: 150.0,
            forceElevated: innerBoxIsScrolled,
          ),
        ];
      },
      body: Container(
          child: Column(
        children: [
          Text(content),
          ElevatedButton(
            onPressed: () => onPressed(),
            child: const Text('Start text to speech'),
          ),
          ElevatedButton(
            onPressed: () => stopSpeaking(),
            child: const Text('Stop'),
          ),
        ],
      )),
    ));
  }
}
