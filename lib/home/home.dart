
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:namer_app/home/text.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}): super(key: key);
  final String title;
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title),actions: [
        ElevatedButton.icon(icon: Icon(Icons.arrow_forward),label: Text("next page"),onPressed: () {
          Navigator.pushNamed(context, "/button");
        }, ),
      ],),

      body: Column(
        children: [
          MyTextPage(),

        ],

      ),
    );
  }
}
