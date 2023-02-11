//MyActivityWidget
//import 'package:flutter/material.dart';

import 'package:flutter/material.dart';


class MyActivityWidget extends StatelessWidget {
  const MyActivityWidget({
    Key? key,
    required this.id,
    required this.title,
    required this.isCompleted,
  }) : super(key: key);

  final String id;
  final String title;
  final String isCompleted;


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(children: [
                            //Text(id),
                            Text('Name of activity: $title'),
                            Text('Completed: $isCompleted'),
                        
                          ]),
    );
  }
}
