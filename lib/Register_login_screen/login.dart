import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quize_app/home/subject_list.dart';

class login1 extends StatefulWidget {
  const login1({Key? key}) : super(key: key);

  @override
  State<login1> createState() => _login1State();
}

TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
final key = GlobalKey<FormState>();
FirebaseAuth auth = FirebaseAuth.instance;

class _login1State extends State<login1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'hello again !',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                    Text(
                      'Welcome',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                    Text(
                      'Back',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'LOGIN TO CONTINUE....',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    TextFormField(
                      controller: email,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        // disabledBorder: InputBorder.none,
                        //focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        prefixIcon: Icon(Icons.account_box),
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "enter email",
                        labelText: "email",
                        labelStyle:
                        TextStyle(fontSize: 25, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter email';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: password,
                      obscureText: true,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        // disabledBorder: InputBorder.none,
                        //focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        prefixIcon: Icon(Icons.security),
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "enter password",
                        labelText: "password",
                        labelStyle:
                        TextStyle(fontSize: 25, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter password';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                auth
                                    .signInWithEmailAndPassword(
                                    email: email.text.toString().trim(),
                                    password: password.text.toString())
                                    .then((value) => Navigator.push(context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return subject_list();
                                      },
                                    )))
                                    .then(
                                      (value) {
                                    email.text = "";
                                    password.text = "";
                                  },
                                ).onError((error, stackTrace) {
                                  Fluttertoast.showToast(
                                      msg: 'email or password is incorrect',
                                      backgroundColor: Colors.red);
                                });
                              }
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(fontSize: 20),
                            ))),
                  ],
                ),
              ),
            ),
            bottomSheet: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                          'https://media.istockphoto.com/id/481401738/vector/sea-vector-illustration-modern-minimal-flat-design-style-ocean-symbol.jpg?s=612x612&w=0&k=20&c=Ik8pYBdh8ZPtYkDb8wQt3zMk-LFdI1vYm9uoqioYax8='))),
            )));
  }
}

