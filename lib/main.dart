
import 'package:flutter/material.dart';
import 'package:namer_app/home/button.dart';
import 'package:namer_app/home/checkbox.dart';
import 'package:namer_app/home/home.dart';
import 'package:namer_app/home/imageicon.dart';
import 'package:namer_app/home/inputform.dart';
import 'package:namer_app/home/progress.dart';
import 'package:namer_app/layout/profile.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/index",
      routes: {
        "/index": (context)=> MyHomePage(title: "home"),
        "/button": (context)=> MyButtonPage(title: "button"),
        "/image": (context)=> MyImagePage(),
        "/switch": (context)=> MyCheckboxPage(),
        "/input": (context)=> MyInputPage(),
        "/progress": (context)=> MyProgressPage(),
        "/layout1": (context)=> MyLayoutRoute(),
      },

    );
  }
}