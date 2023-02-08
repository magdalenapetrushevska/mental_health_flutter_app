import 'package:flutter/material.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget{
  const ResultBox({Key? key, 
  required this.result,
  required this.questionLenght,
  required this.onPressed,
  }) : super(key:key);

 final int result;
 final int questionLenght;
 final VoidCallback onPressed;

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(70.0),
        child:Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Result', style:TextStyle(color:neutral, fontSize: 20.0),),
            const SizedBox(height: 20.0,),
            CircleAvatar(
              child: Text('$result/$questionLenght'),
            ),
            const SizedBox(height: 20.0,),
            GestureDetector(
              onTap: onPressed,
                child: const Text('Start over',style: const TextStyle(color:Colors.blue),),
            ),
        ],),
         ),
    );
  }
}