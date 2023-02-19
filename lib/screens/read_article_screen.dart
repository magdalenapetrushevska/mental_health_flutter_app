import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ReadArticleScreen extends StatefulWidget {
  const ReadArticleScreen({
    Key? key,
    required this.title,
    required this.content,
    required this.image,
  }) : super(key: key);

  final String title;
  final String content;
  final String image;

  @override
  _ReadArticleScreenState createState() =>
      _ReadArticleScreenState(title: title, content: content, image: image);
}

class _ReadArticleScreenState extends State<ReadArticleScreen> {
  var title = '';
  var content = '';
  var image = '';

  _ReadArticleScreenState({
    required this.title,
    required this.content,
    required this.image,
  });

  final FlutterTts flutterTts = FlutterTts();

  void stopSpeaking() async {
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
                expandedHeight: 70.0,
                forceElevated: innerBoxIsScrolled,
              ),
            ];
          },
          body: Column(
            children: [
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  content,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20.0),
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
    );
  }
}
