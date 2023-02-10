import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/screens/rate_mood_screen.dart';
import '../constants.dart';

//class MoodHistoryPage extends StatelessWidget {

import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/models/article_model.dart';
import 'package:mental_health_flutter_app/widgets/article_widget.dart';
import '../constants.dart';
import '../models/db_connect.dart';
import '../models/mood_model.dart';
import '../widgets/mood_widget.dart';



//fetchArticles
class MoodHistoryScreen extends StatefulWidget {
 const MoodHistoryScreen({Key? key,
  }) : super(key:key);

  @override
  _MoodHistoryScreenState createState() => _MoodHistoryScreenState();
}

class _MoodHistoryScreenState extends State<MoodHistoryScreen> {

  _MoodHistoryScreenState();

 var db = DBconnect();

  late Future _moods;

  Future<List<Mood>> getData() async{
    return db.fetchMoods();
  }

  @override
  void initState(){
    _moods = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
        return FutureBuilder(
      future: _moods as Future<List<Mood>>,
      builder: (ctx,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Center(child:Text('${snapshot.error}'),);
          } else if(snapshot.hasData){
            var extractedData = snapshot.data as List<Mood>;
                return Scaffold(
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: const Text('Mood history'),
                  backgroundColor: background,
                  floating: true,
                  expandedHeight: 70.0,
                  forceElevated: innerBoxIsScrolled,
                  actions: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 100,
                        child:
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const RateMoodScreen()));
                },
                icon: const Icon(Icons.add),
                label: const Text('New mood'),
              ),
                      ),
                    ),
          ],
                ),
              ];
            },
            body: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: extractedData.length,
                itemBuilder: (BuildContext context, int index) {
                  return MoodWidget(
                    mood: extractedData[index].mood,
                    datetime:extractedData[index].datetime,
                  );
                })));
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

