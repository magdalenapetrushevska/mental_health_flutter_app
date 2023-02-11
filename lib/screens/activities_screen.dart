import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/models/article_model.dart';
import 'package:mental_health_flutter_app/widgets/article_widget.dart';
import '../constants.dart';
import '../models/activity.dart';
import '../models/db_connect.dart';
import '../widgets/activity_widget.dart';



//fetchArticles
class ActivityScreen extends StatefulWidget {
 const ActivityScreen({Key? key,
   required this.moodCategory,
  }) : super(key:key);

   final int moodCategory;

  @override
  _ActivityScreenState createState() => _ActivityScreenState(moodCategory: moodCategory);
}

class _ActivityScreenState extends State<ActivityScreen> {

    int moodCategory;

  //_ActivityScreenState();
  _ActivityScreenState({
  required this.moodCategory,
  });

 var db = DBconnect();

  late Future _activities;

  Future<List<Activity>> getData() async{
    return db.fetchActivities(moodCategory);
  }

  @override
  void initState(){
    _activities = getData();
    super.initState();
  }

   int index = 0;


  @override
  Widget build(BuildContext context) {
        return FutureBuilder(
      future: _activities as Future<List<Activity>>,
      builder: (ctx,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Center(child:Text('${snapshot.error}'),);
          } else if(snapshot.hasData){
            var extractedData = snapshot.data as List<Activity>;
                return Scaffold(
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: const Text('Recommended activities'),
                  backgroundColor: background,
                  floating: true,
                  expandedHeight: 50.0,
                  forceElevated: innerBoxIsScrolled,
                ),
              ];
            },
            body: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: extractedData.length,
                itemBuilder: (BuildContext context, int index) {
                  return
                      ActivityWidget(
                    title: extractedData[index].title,
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

