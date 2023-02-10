import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_tts/flutter_tts.dart';



class ExampleTestingScreen extends StatefulWidget {

  const ExampleTestingScreen({Key? key,
  required this.content,
  }) : super(key:key);

    final String content;

  @override
  _ExampleTestingScreenState createState() => _ExampleTestingScreenState(content: content);
}

class _ExampleTestingScreenState extends State<ExampleTestingScreen> {
  var content;


  _ExampleTestingScreenState({
  required this.content,
  });


  final FlutterTts flutterTts = FlutterTts();


  void onPressed() async{
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1);
    await flutterTts.speak(content);
  }



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
                  title: const Text('Floating Nested SliverAppBar'),
                  floating: true,
                  //expandedHeight: 200.0,
                  forceElevated: innerBoxIsScrolled,
                ),
              ];
            },
             body: //ListView.builder(
            //     padding: const EdgeInsets.all(8),
            //     itemCount: 30,
            //     itemBuilder: (BuildContext context, int index) {
            //       return SizedBox(
            //         height: 50,
            //         child: Center(child: Text('Item $index')),
            //       );
            //     }),
            Container(
              child:Column(children: [
                Text('Example article title'),
                SizedBox(height: 10.0,),
                Text('Example content article'),
                ElevatedButton(
              onPressed: () => onPressed(),
              child:Text('Start text to speech'),),
              ],)
            ),
                ));
  }
}

