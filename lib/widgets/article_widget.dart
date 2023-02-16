import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/read_article_screen.dart';

class ArticleWidget extends StatelessWidget {
  const ArticleWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.imageUrl,
  }) : super(key: key);

  final String title;
  final String content;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
                width: 500, height: 100, child: Image.network(imageUrl)),
          ),
          SizedBox(
            width: 130,
            height: 55,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: background,
                ),
                child: const Text(
                  "Read more",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ReadArticleScreen(title:title, content: content,image:imageUrl)));
                },
              ),
            ),
          ),
          const Divider(
                                  //color: Colors.black,
                                  height: 25,
                                  thickness: 2,
                                  indent: 25,
                                  endIndent: 25,
                                ),
                                SizedBox(height: 20.0,),
        ],
      ),
    );
  }
}
