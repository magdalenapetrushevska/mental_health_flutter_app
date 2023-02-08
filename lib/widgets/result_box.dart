import 'package:flutter/material.dart';
import '../constants.dart';

class ResultBox extends StatelessWidget{
  const ResultBox({Key? key, 
  required this.result,
  required this.onPressed,
  required this.testScore,
  }) : super(key:key);

 final int result;
 final VoidCallback onPressed;
 final String testScore;

  @override
  Widget build(BuildContext context){
    return AlertDialog(
      backgroundColor: background,
      content: Padding(
        padding: const EdgeInsets.all(20.0),
        child:Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('TEST SCORE', style:TextStyle(color:neutral, fontSize: 20.0),),
            const SizedBox(height: 20.0,),
            CircleAvatar(
              child: Text('$result/16'),
            ),
            const SizedBox(height: 20.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Your results indicate that you may be experiencing some signs of $testScore anxiety.'),
            ),
            const SizedBox(height: 20.0,),
            GestureDetector(
              onTap: onPressed,
                child: const Text('Take another test',style: const TextStyle(color:Colors.blue),),
            ),
        ],),
         ),
    );
  }
}