import 'package:http/http.dart' as http;
import './question_model.dart';
import 'dart:convert';

class DBconnect{

  //final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/ocd_questions.json');
  //   Future<void> addQuestion(Question question) async{
  //   http.post(url,
  //   body: json.encode({
  //     'title':question.title,
  //     'options':question.options,
  //   }));
  // }

  Future<List<Question>> fetchQuestions(String testCategory) async {

    if(testCategory=='anxiety'){
      final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/anxiety_questions.json');

    return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String,dynamic>;
      List<Question> newQuestions = [];

      data.forEach((key, value){
        var newQuestion =  Question(
          id: key,
          title:value['title'],
          options: Map.castFrom(value['options']),
        );

        newQuestions.add(newQuestion);
      });
      return newQuestions;
    });

    }
    else if(testCategory=='depression'){
      final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/depression_questions.json');
      return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String,dynamic>;
      List<Question> newQuestions = [];

      data.forEach((key, value){
        var newQuestion =  Question(
          id: key,
          title:value['title'],
          options: Map.castFrom(value['options']),
        );

        newQuestions.add(newQuestion);
      });
      return newQuestions;
    });

    }
    else if(testCategory=='imposter'){
      final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/imposter_syndrome_questions.json');
      return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String,dynamic>;
      List<Question> newQuestions = [];

      data.forEach((key, value){
        var newQuestion =  Question(
          id: key,
          title:value['title'],
          options: Map.castFrom(value['options']),
        );

        newQuestions.add(newQuestion);
      });
      return newQuestions;
    });

    }
    else{
      final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/ocd_questions.json');
      return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String,dynamic>;
      List<Question> newQuestions = [];

      data.forEach((key, value){
        var newQuestion =  Question(
          id: key,
          title:value['title'],
          options: Map.castFrom(value['options']),
        );

        newQuestions.add(newQuestion);
      });
      return newQuestions;
    });

    }
  }



}