
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCheckboxPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("单选开关和复选框"),actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(context, "/input");
        }, icon: Icon(Icons.arrow_forward)),
      ],),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MySwitch(),
        ],
      ),
    );
  }
}

class MySwitch extends StatefulWidget {
  @override
  _MySwitchState createState() => _MySwitchState();
}

class _MySwitchState extends State<MySwitch>{

  bool _switchSelected = true;
  bool _checkboxSelected = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(value: _switchSelected, onChanged: (value){
          setState(() {
            _switchSelected = value;
          });
        }),
        Checkbox(value: _checkboxSelected,activeColor: Colors.red, onChanged: (value){
          setState(() {
            _checkboxSelected = value!;
          },);
        }),
      ],
    );
  }
}