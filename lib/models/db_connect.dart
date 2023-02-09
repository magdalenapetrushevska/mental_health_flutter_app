import 'package:http/http.dart' as http;
import 'package:mental_health_flutter_app/models/quote_model.dart';
import './question_model.dart';
import 'dart:convert';
import 'dart:math';

class DBconnect{

  //final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/ocd_questions.json');
  //   Future<void> addQuestion(Question question) async{
  //   http.post(url,
  //   body: json.encode({
  //     'title':question.title,
  //     'options':question.options,
  //   }));
  // }

    Future<void> addFavoriteQuote(Quote quote) async{
      final favoriteQuoteUrl = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/favorites-quotes.json');
    http.post(favoriteQuoteUrl,
    body: json.encode({
      'content':quote.content,
      'author':quote.author,
    }));
  }

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


  Future<bool> checkFavoriteQuoteExistence(String content) async {

    bool ret = false;
    
    final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/favorites-quotes.json');

    return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String,dynamic>;

      data.forEach((key, value){
        if(value['content'] == content){
          ret = true;
        }
      });
      return ret;
    });
 
  }

  // Future<Quote> fetchRandomQuote() async {
  //   Future<List<Quote>> newQuotes = fetchQuotes() as Future<List<Quote>>;
  //   Random random = Random();
  //   int randomNumber = 0;
  //   randomNumber = random.nextInt(newQuotes.length);
  //   return newQuotes[randomNumber];

  // }


  Future<Quote> fetchRandomQuote() async {
    
    final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/quotes.json');

    return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String,dynamic>;
      List<Quote> newQuotes = [];

      data.forEach((key, value){
        var newQuote =  Quote(
          id: key,
          content:value['content'],
          author: value['author'],
        );

        //extractedData.forEach((profileId, profileData) {
      // loadedProfile.add(
      //   Profile(
      //     email: profileData['email'],
      //     lastName: profileData['firstName'],
      //     firstName: profileData['lastName'],
      //   ),

        newQuotes.add(newQuote);
      });

      Random random = Random();
      int randomNumber = 0;
      randomNumber = random.nextInt(newQuotes.length);
      return newQuotes[randomNumber];
      //return newQuotes;
    });
 
  }




Future<List<Quote>> fetchFavoriteQuotes() async {

    
      final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/favorites-quotes.json');

   return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String,dynamic>;
      List<Quote> newQuotes = [];

      data.forEach((key, value){
        var newQuote =  Quote(
          id: key,
          content:value['content'],
          author: value['author'],
        );

        newQuotes.add(newQuote);
      });
      return newQuotes;
    });




}


// Random random = Random();
//   int randomNumber = 0;

//   void _quotesGenerator() {
//     setState(() {
//       randomNumber = random.nextInt(quotes.length);
//     });
//   }





    
}
   
  



