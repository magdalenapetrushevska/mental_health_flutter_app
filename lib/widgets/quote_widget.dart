import 'package:flutter/material.dart';
import '../constants.dart';

class QuoteWidget extends StatelessWidget{
  const QuoteWidget({Key? key,
  required this.content,
  required this.author,
  }): super(key:key);

  final String content;
  final String author;

  @override
  Widget build(BuildContext context){
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Text(
            content,
            style:const TextStyle(
              fontSize: 24,
              color:neutral,
            ),
            ),
            Text(author,
            style:const TextStyle(
              fontSize: 24,
              color:neutral,
            
            ),
            ),
        ],
      ),
    );
  }
}