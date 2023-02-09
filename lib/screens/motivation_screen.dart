import 'package:flutter/material.dart';
import '../models/db_connect.dart';
import '../constants.dart';
import '../models/quote_model.dart';
import '../widgets/next_quote_button_widget.dart';
import '../widgets/quote_widget.dart';

class MotivationScreen extends StatefulWidget {
  const MotivationScreen({Key? key,
  }) : super(key:key);


  @override
  _MotivationScreenState createState() => _MotivationScreenState();
}

class _MotivationScreenState extends State<MotivationScreen> {


  _MotivationScreenState();
  var db = DBconnect();

  late Future _quote;

  // Future<List<Quote>> getData() async{
  //   return db.fetchQuotes();
  // }

  Future<Quote> getData() async{
    return db.fetchRandomQuote();
  }

  @override
  void initState(){
    _quote = getData();
    super.initState();
  }


  void nextQuote(){
    setState(() {
      _quote = getData();
    });
    Navigator.canPop(context);
  }




  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: _quote as Future<Quote>,
      builder: (ctx,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Center(child:Text('${snapshot.error}'),);
          } else if(snapshot.hasData){
            var extractedData = snapshot.data as Quote;
            return Scaffold(
        backgroundColor:background,
        appBar: AppBar(
          title: const Text('Motivation quotes'),
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
            const SizedBox(height: 40.0,),
            QuoteWidget(
              content: extractedData.content, 
              author: extractedData.author, 
            ),
             
          ],)
        ),
        floatingActionButton: GestureDetector(
          onTap: () => nextQuote(),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal:10.0),
            child: NextQuote(
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
