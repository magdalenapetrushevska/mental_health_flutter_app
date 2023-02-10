import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/screens/example_testing_screen.dart';
import '../constants.dart';

class ArticleWidget extends StatelessWidget{
  const ArticleWidget({Key? key,
  required this.title,
  required this.content,
  required this.imageUrl,
  }): super(key:key);

  final String title;
  final String content;
  final String imageUrl;

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.centerLeft,
      child:Column(
        children:[
              Text("Depression treatment is different for everyone",style: TextStyle(fontWeight: FontWeight.bold),),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: SizedBox(child: Image.asset('assets/images/article_second_depression.webp'),width: 500,height:100),
            ),
             SizedBox(
              width: 130,
              height: 55,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 230, 120, 153),
                  ),
                  child: Text(
                    "Read more",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExampleTestingScreen( content: 'This is simple mental health app.')));
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ExampleTestingScreen( content: content)));
                  },
                ),
              ),
            ),
        ],
      ),
      // child: Text(
      //   'Artcile $title $content :$imageUrl',
      //   style:const TextStyle(
      //     fontSize: 24,
      //     color:neutral,
      //   ),
      //   ),
    );
  }
}