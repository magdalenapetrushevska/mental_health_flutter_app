import 'package:http/http.dart' as http;
import 'package:mental_health_flutter_app/models/activity.dart';
import 'package:mental_health_flutter_app/models/emergency_contact_model.dart';
import 'package:mental_health_flutter_app/models/quote_model.dart';
import '../models/question_model.dart';
import 'dart:convert';
import 'dart:math';

import '../models/article_model.dart';
import '../models/completed_activity.dart';
import '../models/mood_model.dart';

class DBconnect{




Future<void> updateMood(String moodId, Mood mood) async {
    final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/moods/$moodId.json');
    http.put(
      url,
      body: json.encode({
        'mood': mood.mood,
        'datetime': mood.datetime,
      }),
    );
  }


    Future<void> addActivity(Activity activty) async {
    final url = Uri.parse(
        'https://mental-health-flutter-app-default-rtdb.firebaseio.com/activities.json');
    http.post(url,
        body: json.encode({
          'title': activty.title,
          'moodCategory': activty.moodCategory,
        }));
  }
  
  
    Future<void> addCompletedActivity(CompletedActivity activity) async {
    final url = Uri.parse(
        'https://mental-health-flutter-app-default-rtdb.firebaseio.com/completed_activities.json');
    http.post(url,
        body: json.encode({
          'title': activity.title,
          'isCompleted': activity.isCompleted,
        }));
  }

Future<List<CompletedActivity>> fetchCompltedActivities() async {
    
      final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/completed_activities.json');

   return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String,dynamic>;
      List<CompletedActivity> newCompltedActivities = [];

      data.forEach((key, value){
        var newCompltedActivity =  CompletedActivity(
          id: key,
          title: value['title'],
          isCompleted:value['isCompleted'],
        );

        newCompltedActivities.add(newCompltedActivity);
      });
      //print(newCompltedActivities);
      return newCompltedActivities;
    });

}



Future<List<ContactSettings>> fetchContact() async {
    
      final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/contact_settings.json');

   return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String,dynamic>;
      List<ContactSettings> contactsSettings = [];

      data.forEach((key, value){
        var newContactSetting =  ContactSettings(
          id: key,
          phone: value['phone'],
          email:value['email'],
        );

        contactsSettings.add(newContactSetting);
      });
      return contactsSettings;
    });

}




  Future<void> updateContactSettings(String contactId,String phone, String email) async {
    final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/contact_settings/$contactId.json');
    http.put(
      url,
      body: json.encode({
        'phone': phone,
        'email': email,
      }),
    );
  }


  Future<void> updateCompletedActivtiy(String activityId,String title) async {
    final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/completed_activities/$activityId.json');
    http.put(
      url,
      body: json.encode({
        'title': title,
        'isCompleted': 'true',
      }),
    );
  }


    Future<void> addMood(Mood mood) async {
    final url = Uri.parse(
        'https://mental-health-flutter-app-default-rtdb.firebaseio.com/moods.json');
    http.post(url,
        body: json.encode({
          'mood': mood.mood,
          'datetime': mood.datetime,
        }));
  }

      Future<void> addContact(ContactSettings contact) async {
    final url = Uri.parse(
        'https://mental-health-flutter-app-default-rtdb.firebaseio.com/contact_settings.json');
    http.post(url,
        body: json.encode({
          'phone': contact.phone,
          'email': contact.email,
        }));
  }


  Future<void> addArticle(Article article) async {
    final url = Uri.parse(
        'https://mental-health-flutter-app-default-rtdb.firebaseio.com/articles.json');
    http.post(url,
        body: json.encode({
          'title': article.title,
          'content': article.content,
          'imageUrl': article.imageUrl,
        }));
  }

  Future<List<Activity>> fetchActivities(int mood) async {
    final url = Uri.parse(
        'https://mental-health-flutter-app-default-rtdb.firebaseio.com/activities.json');

    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Activity> newActivities = [];

      data.forEach((key, value) {
        if (mood == value['moodCategory']) {
          var newActivity = Activity(
            id: key,
            title: value['title'],
            moodCategory: value['moodCategory'],
          );

          newActivities.add(newActivity);
        }
      });
      List<Activity> recommendedActivities = [];
      Random random = Random();
      int randomNumber = 0;
      for (int i = 0; i <= 3; i++) {
        randomNumber = random.nextInt(newActivities.length);
        recommendedActivities.add(newActivities[randomNumber]);
      }
      
      return recommendedActivities;
    });
  }


Future<List<Mood>> fetchMoods() async {
    
      final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/moods.json');

   return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String,dynamic>;
      List<Mood> newMoods = [];

      data.forEach((key, value){
        var newMood =  Mood(
          id: key,
          mood: value['mood'],
          datetime:value['datetime'],
        );

        newMoods.add(newMood);
      });
      return newMoods;
    });

}

Future<List<Article>> fetchArticles() async {
    
      final url = Uri.parse('https://mental-health-flutter-app-default-rtdb.firebaseio.com/articles.json');

   return http.get(url).then((response){
      var data = json.decode(response.body) as Map<String,dynamic>;
      List<Article> newArticles = [];

      data.forEach((key, value){
        var newQuote =  Article(
          id: key,
          title: value['title'],
          content:value['content'],
          imageUrl: value['imageUrl'],
        );

        newArticles.add(newQuote);
      });
      return newArticles;
    });

}

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
   
  



