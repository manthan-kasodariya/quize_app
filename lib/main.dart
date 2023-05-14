import 'package:flutter/material.dart';
import 'package:quize_app/Register_login_screen/register.dart';
import 'package:quize_app/home/subject_list.dart';
import 'final result/final_result.dart';
import 'package:firebase_core/firebase_core.dart';

import 'home/subject_list2.dart';

void main() async {
WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: register(),
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent)
      ),
    );
  }
}


