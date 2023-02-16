import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/screens/test_category_screen.dart';
import '../db_connection/db_connect.dart';
import '../constants.dart';
import '../models/question_model.dart';
import '../widgets/question_widget.dart';
import '../widgets/next_button_widget.dart';
import '../widgets/option_card.dart';
import '../widgets/result_box.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key,
  required this.testCategory,
  }) : super(key:key);

    final String testCategory;

  @override
  _TestScreenState createState() => _TestScreenState(testCategory: testCategory);
}

class _TestScreenState extends State<TestScreen> {
  var testCategory;


  _TestScreenState({
  required this.testCategory,
  });
  var db = DBconnect();

  late Future _questions;

  Future<List<Question>> getData() async{
    return db.fetchQuestions(testCategory);
  }

  @override
  void initState(){
    _questions = getData();
    super.initState();
  }

  //List<Question> _questions = [
  //   Question(
  //     id: '1',
  //     title: 'Question 1 example',
  //     options: {'5': false, '30':false, '4':true, '10':false},
  //     ),
  //     Question(
  //     id: '2',
  //     title: 'Question 2 example',
  //     options: {'50': false, '30':true, '40':false, '10':false},
  //     ),
  // ];

  int index = 0;
  bool isPressed = false;
  int pressedOption = 3;
  int score = 0;
  bool isAlreadySelected = false;
  String testScore = '';

  void nextQuestion(int questionLenght){
    if(index == questionLenght-1){
      showDialog(
        context: context, 
        barrierDismissible: false,
      builder: (ctx)=>ResultBox(
        result:score,
        onPressed: startOver,
        testScore: testScore,
      ));
    } else{
      if(isPressed){
    setState(() {
      index++;
      isPressed = false;
      pressedOption = 3;
      isAlreadySelected = false;
    });
      } else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select any option'),
          behavior: SnackBarBehavior.floating,
          margin:EdgeInsets.symmetric(vertical: 20.0),
          ));
      }
    }
  }

  void checkAnswerAndUpdate(int value){
    if(isAlreadySelected){
      return;
    }

    score+=value;
    checkTestScore();

    setState(() {
      pressedOption = value;
      isPressed = true;
      isAlreadySelected = true;
    });
  
  }

  void checkTestScore(){
    if(score <= 5){
      testScore = 'mild';
    } else if(score >= 6 && score <= 11){
      testScore = 'moderate';
    } else{
      testScore = 'severe';
    }
  }

  void startOver(){
    setState((){
      index = 0;
      score = 0;
      isPressed = false;
      pressedOption = 3;
      isAlreadySelected = false;
      testScore = '';
    });
    //Navigator.pop(context);
    Navigator.push(context,
      MaterialPageRoute(builder: (context) => TestCategoryScreen()));
  }

  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Center(child:Text('${snapshot.error}'),);
          } else if(snapshot.hasData){
            var extractedData = snapshot.data as List<Question>;
            return Scaffold(
        backgroundColor:background,
        appBar: AppBar(
          title: Text('$testCategory test'),
          backgroundColor: background,
          shadowColor: Colors.transparent,
          // actions: [
          //   Padding(padding: const EdgeInsets.all(18.0),
          //    child:Text('Score: $score',
          //    style:const TextStyle(fontSize: 18.0)),),
          // ],
        ),
        
        body:Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          width: double.infinity,
          child:Column(children: [
            SizedBox(height: 40.0,),
            QuestionWidget(
              question: extractedData[index].title, 
              indexAction: index, 
              totalQuestions: extractedData.length),
              const Divider(color:neutral),
              const SizedBox(height: 25.0),
              for(int i=0;i<extractedData[index].options.length;i++)
    
                GestureDetector(
                  onTap:()=>checkAnswerAndUpdate( extractedData[index].options.values.toList()[i]),
                  child: OptionCard(option: extractedData[index].options.keys.toList()[i],
                  color: isPressed ?  extractedData[index].options.values.toList()[i] == pressedOption ? chosen : notchosen : neutral,
                  ),
                ),
          ],)
        ),
        floatingActionButton: GestureDetector(
          onTap: () => nextQuestion(extractedData.length),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: NextButton(
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
          }
        }
        else{
          return const Center(child:CircularProgressIndicator(),);
        }
        
        return const Center(child:Text('No data'),);
      },
      
    );
  }
}
