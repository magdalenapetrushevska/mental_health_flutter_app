import 'package:flutter/material.dart';
import '../constants.dart';

class NextQuote extends StatelessWidget{
  const NextQuote({Key? key,}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color:neutral,
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: const EdgeInsets.symmetric(vertical:10.0),
      child:const Text(
        'Next quote',
        textAlign: TextAlign.center,
      )
    );
  }
}