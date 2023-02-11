import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/models/article_model.dart';
import 'package:mental_health_flutter_app/widgets/article_widget.dart';
import '../constants.dart';
import '../models/completed_activity.dart';
import '../models/db_connect.dart';
import '../widgets/my_activity_widget.dart';

//fetchArticles
class MyActivitiesScreen extends StatefulWidget {
  const MyActivitiesScreen({
    Key? key,
  }) : super(key: key);

  @override
  _MyActivitiesScreenState createState() => _MyActivitiesScreenState();
}

class _MyActivitiesScreenState extends State<MyActivitiesScreen> {
  _MyActivitiesScreenState();

  var db = DBconnect();

  late Future _completedActivities;

  Future<List<CompletedActivity>> getData() async {
    return db.fetchCompltedActivities();
  }

  @override
  void initState() {
    _completedActivities = getData();
    super.initState();
  }

  int index = 0;

  void onPressed(String activityId, String title) {
    db.updateCompletedActivtiy(activityId, title);
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const MyActivitiesScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _completedActivities as Future<List<CompletedActivity>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<CompletedActivity>;
            return Scaffold(
                body: NestedScrollView(
                    floatHeaderSlivers: true,
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                      return <Widget>[
                        SliverAppBar(
                          title: const Text('My activities'),
                          backgroundColor: background,
                          floating: true,
                          expandedHeight: 70.0,
                          forceElevated: innerBoxIsScrolled,
                        ),
                      ];
                    },
                    body: ListView.builder(
                        padding: const EdgeInsets.all(8),
                        itemCount: extractedData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              MyActivityWidget(
                                id: extractedData[index].id,
                                title: extractedData[index].title,
                                isCompleted: extractedData[index].isCompleted,
                              ),
                              if (extractedData[index].isCompleted == 'false')
                                ElevatedButton(
                                  onPressed: () => onPressed(
                                      extractedData[index].id,
                                      extractedData[index].title),
                                  child: const Text('Mark as completed'),
                                ),
                              const Divider(
                                color: Colors.black,
                                height: 25,
                                thickness: 2,
                                indent: 25,
                                endIndent: 25,
                              ),
                            ],
                          );
                        })));
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return const Center(
          child: Text('No data'),
        );
      },
    );
  }
}
