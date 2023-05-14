import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quize_app/quizescreen/quizescreen.dart';

class subject_list extends StatefulWidget {
  const subject_list({Key? key}) : super(key: key);

  @override
  State<subject_list> createState() => _subject_listState();
}

class _subject_listState extends State<subject_list> {
  final List subject_list = const [
    "English" , "Social_science" , "Computer"
  ];
  int? index_of_questions ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SubjectList',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
           ListView.builder(
            shrinkWrap: true,
            itemCount: subject_list.length,
            itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>quizescreen(title: subject_list[index],index_of_questions: index,)));
                  print(index);

                },
                tileColor: Colors.blueGrey,
                leading: Text(subject_list[index],style: TextStyle(color: Colors.white),),
                trailing: Icon(Icons.arrow_forward),
              ),

            );
          },),

        ],
      ),
    );
  }
}
