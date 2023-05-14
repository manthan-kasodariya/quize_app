import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quize_app/Register_login_screen/login.dart';
import 'package:quize_app/home/subject_list.dart';

import '../home/subject_list2.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
final key = GlobalKey<FormState>();
FirebaseAuth auth = FirebaseAuth.instance;

class _registerState extends State<register> {
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
                      'hello',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                    Text(
                      'signup',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                    Text(
                      'to get started',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    TextFormField(
                      controller: name,
                      style: TextStyle(fontSize: 18, color: Colors.black),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black)),
                        // disabledBorder: InputBorder.none,
                        //focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        prefixIcon: Icon(Icons.account_box),
                        hintStyle: TextStyle(color: Colors.black),
                        hintText: "enter name",
                        labelText: "name",
                        labelStyle:
                        TextStyle(fontSize: 25, color: Colors.black),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'please enter name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 30,
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
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Email";
                          } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return "Please Enter a Valid Email";
                          }
                          return null;
                        }),
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
                        hintText: "enter email",
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
                      height: 40,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                            onPressed: () {
                              if (key.currentState!.validate()) {
                                auth.createUserWithEmailAndPassword(
                                    email: email.text.toString().trim(),
                                    password: password.text.toString().trim());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => subject_list2()));
                                print('sign up successful');
                                add_user();
                              }

                            },
                            child: Text(
                              'Sign up',
                              style: TextStyle(fontSize: 20),
                            ))),
                    Align(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => login1()));
                          },
                          child: Text('already have account ? log in')),
                    )
                  ],
                ),
              ),
            ),
            bottomSheet: Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: NetworkImage(
                          'https://media.istockphoto.com/id/481401738/vector/sea-vector-illustration-modern-minimal-flat-design-style-ocean-symbol.jpg?s=612x612&w=0&k=20&c=Ik8pYBdh8ZPtYkDb8wQt3zMk-LFdI1vYm9uoqioYax8='))),
            )));
  }
}

add_user() {
  DatabaseReference ref = FirebaseDatabase.instance.ref('user').push();
  String? id = ref.key;
  ref.set({
    'id': id,
    'name': name.text.toString(),
    'email': email.text.toString(),
  });
  print("user added");
}