import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/widgets/quote_widget.dart';
import '../db_connection/db_connect.dart';
import '../constants.dart';
import '../models/quote_model.dart';
import '../widgets/next_quote_button_widget.dart';


class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key,
  }) : super(key:key);


  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {


  _FavoritesScreenState();
  var db = DBconnect();

  late Future _quotes;

  Future<List<Quote>> getData() async{
    return db.fetchFavoriteQuotes();
  }

  @override
  void initState(){
    _quotes = getData();
    super.initState();
  }

  int index = 0;

 void nextQuote(int questionLenght){
    if(index == questionLenght-1){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('No more favorites'),
          behavior: SnackBarBehavior.floating,
          margin:EdgeInsets.symmetric(vertical: 20.0),
          ));
        return;
    } else{
    
    setState(() {
      index++;
    });
       
    }
  }



  @override
  Widget build(BuildContext context){
    return FutureBuilder(
      future: _quotes as Future<List<Quote>>,
      builder: (ctx,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Center(child:Text('${snapshot.error}'),);
          } else if(snapshot.hasData){
            var extractedData = snapshot.data as List<Quote>;
            return Scaffold(
        backgroundColor:background,
        appBar: AppBar(
          title: Text('Favorites'),
          backgroundColor: background,
          shadowColor: Colors.transparent,
        ),
        
        body:Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          width: double.infinity,
          child:Column(children: [
            const SizedBox(height: 40.0,),
            QuoteWidget(
              content: extractedData[index].content, 
              author:extractedData[index].author, 
),
              const Divider(color:neutral),
              const SizedBox(height: 25.0),
          ],)
        ),
        floatingActionButton: GestureDetector(
          onTap: () => nextQuote(extractedData.length),
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
