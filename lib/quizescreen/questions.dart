import 'package:flutter/cupertino.dart';

class questions{
  List<List> english_question = [
   [ "please stop .... so many mistakes",
    "our sir teaches mathematics .....english",
    "please dont laugh .... those beggars"],
    [
      "Who returned his knighthood after the 'Jallianwala Bagh massacre?",
      " Where is the dargah of Sheikh Khwaja Qutbuddin Bakhtiyar Kaki located?",
      "When was the budget system introduced for the first time in India"
    ],
    [
      "A process is a _______.",
      " What is smallest unit of the information?",
      "What is the decimal equivalent of the binary number 10111?"
    ]
  ];

  List<List<List>> options =[
    [
      ["A to make", "B making", "C makes", "D make"],
    ["A across", "B besides", "C beside", "D both"],
    ["A on", "B at", "C in", "D for"],
    ],

    [["A Dr. B. R. Ambedkar" , "B Mahatma Gandhi" , "C Bal Gangadhar Tilak" , "D Rabindra Nath Tagore"],
      ["A Ajmer" , "B Ajidhan", "C Agra", "D Delhi"],
      ["A 1867", "B 1860" , "C 1897", "D 1890"],],
    [
      ["A single thread of execution","B program in the execution" , "C program in the memory" , "D task"],
      ["A A bit" , "B A byte" , "C A block" , "D A nibble"],
      ["A 21" , "B 39" , "C 42" , "D 23"],
    ],
  ];



  List answers = [

    ["B making","B besides","B at"],
    ["D Rabindra Nath Tagore" , "D delhi" ,"B 1860"],
    ["B program in the execution" , "A A bit" , "D 23"],

  ];

}