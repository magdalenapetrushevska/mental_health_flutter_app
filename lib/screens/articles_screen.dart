import 'package:flutter/material.dart';
import 'package:mental_health_flutter_app/models/article_model.dart';
import 'package:mental_health_flutter_app/widgets/article_widget.dart';
import '../constants.dart';
import '../db_connection/db_connect.dart';



//fetchArticles
class ArticlesScreen extends StatefulWidget {
 const ArticlesScreen({Key? key,
  }) : super(key:key);

  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {

  _ArticlesScreenState();

 var db = DBconnect();

  late Future _articles;

  Future<List<Article>> getData() async{
    return db.fetchArticles();
  }

  @override
  void initState(){
    _articles = getData();
    super.initState();
  }

   int index = 0;


  @override
  Widget build(BuildContext context) {
        return FutureBuilder(
      future: _articles as Future<List<Article>>,
      builder: (ctx,snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          if(snapshot.hasError){
            return Center(child:Text('${snapshot.error}'),);
          } else if(snapshot.hasData){
            var extractedData = snapshot.data as List<Article>;
                return Scaffold(
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  title: const Text('Articles'),
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
                  return ArticleWidget(
                    title: extractedData[index].title,
                    content:extractedData[index].content,
                    imageUrl: extractedData[index].imageUrl,
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

