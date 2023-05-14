import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quize_app/final%20result/final_result.dart';
import 'questions.dart';
import 'package:fluttertoast/fluttertoast.dart';


class quizescreen extends StatefulWidget {
   quizescreen({Key? key,required this.title,required this.index_of_questions,}) : super(key: key);

  String title;
  int index_of_questions;


  @override
  State<quizescreen> createState() => quizescreenState();
}

class quizescreenState extends State<quizescreen> {
  questions q = questions();
  int question_count = 0;
  final PageController pc = PageController(initialPage: 0);
  int correct_answer = 0;
  int wrong_answwer = 0;
  int not_attempted = 0;
  bool isticked = false;
  static var maxseconds = 60;
  int seconds = maxseconds;
  bool istimertrue = false;


@override
  void initState() {
    // TODO: implement initState
    super.initState();
    settime();
}
  void settime()  {
    maxseconds = 60;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if(istimertrue == true){
        timer.cancel();
      }
      setState(() {
        if (maxseconds > 0) {
          maxseconds--;
          istimertrue = false;
        }else{
          nextpage();
          not_attempted++;
        }

      });
    });

    print("function runned");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("${widget.title} quize"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:   [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.black,
                child: Text("Questions : ${question_count +1} / ${q.english_question.length}",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
              Text("TIME : ${maxseconds.toString()}",style: TextStyle(color: Colors.white,fontSize: 20),)
              
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: PageView.builder(
              controller: pc,
              itemCount: q.english_question.length,
              onPageChanged: (page){
                setState(() {
                  question_count = page;
                });
    },
              itemBuilder: (context, index1) {
               return Column(
                 children: [
                   Container(
                     height :100,
                     decoration: BoxDecoration(
                       color: Colors.black,
                     ),
                     child: Container(
                       //height: 200,
                       alignment: Alignment.centerLeft,
                       color: Colors.yellowAccent,
                       child: Text("Question:${question_count+1} : ${q.english_question[widget.index_of_questions][index1]}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                     ),
                   ),
                   ListView.builder(
                     itemBuilder: (context, index) {
                     return Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: ListTile(
                         tileColor: Colors.blueGrey,
                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                         onTap: (){
                           if(isticked == false){
                             if(q.answers[widget.index_of_questions][index1] == q.options[widget.index_of_questions][index1][index]){
                               showmsg_correct();
                               correct_answer++;
                               nextpage();

                             }else{
                               showmsg_incorrect();
                               wrong_answwer++;
                               nextpage();
                             }
                           }else{
                             showmsg_AlreayTicked();
                             nextpage();
                           }





                         },

                         title: Text(q.options[widget.index_of_questions][index1][index],style: TextStyle(color: Colors.white),),
                       ),
                     );
                   },
                   shrinkWrap: true,
                     itemCount: q.options[widget.index_of_questions][index1].length,
                   ),
                   SizedBox(
                     height: 60,
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       children: [
                         ElevatedButton(
                             onPressed: (){
                               previouspage();
                             }, child: Text("previous",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                         style: ElevatedButton.styleFrom(
                           primary: Colors.yellowAccent,
                         ),
                         ),
                         ElevatedButton(onPressed: (){
                           nextpage();
                           not_attempted++;
                           // if(pc.page!.toInt() == 2 ){
                           //   Navigator.push(context, MaterialPageRoute(builder: (context)=>final_result(corrct_answer: correct_answer,wrong_answer: wrong_answwer,not_attempted: not_attempted,)));
                           // }
                         }, child: Text("next",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                         style: ElevatedButton.styleFrom(
                           primary: Colors.yellowAccent,
                         ),
                         ),
                       ],

                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     ),
                   ),
                  
                 ],
               );
                }),
          )
        ],
      )
    );
  }
   showmsg_correct(){
    return Fluttertoast.showToast(msg: "correct",backgroundColor: Colors.green,);
  }

  showmsg_incorrect() {
    return Fluttertoast.showToast(msg: "wrong", backgroundColor: Colors.red,gravity: ToastGravity.SNACKBAR);
  }
  showmsg_AlreayTicked() {
    return Fluttertoast.showToast(msg: "Already Ticked", backgroundColor: Colors.grey);
  }


  void nextpage(){
    pc.animateToPage(pc.page!.toInt()+1, duration: Duration(microseconds: 400), curve:Curves.easeIn);
    if(pc.page!.toInt() == 2 ){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>final_result(corrct_answer: correct_answer,wrong_answer: wrong_answwer,not_attempted: not_attempted,)));
    }
    print(pc.page!.toInt());
    isticked = false;
    istimertrue = true;
    settime();



  }

  void previouspage(){

    pc.animateToPage(pc.page!.toInt()-1, duration: Duration(microseconds: 400), curve: Curves.bounceInOut);
    print(pc.page!.toInt() - 1);
    isticked = true;


  }


  }



