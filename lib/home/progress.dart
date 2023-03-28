

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProgressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("进度条"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pushNamed(context, "/layout1");
          }, child: Text("下一章",style: TextStyle(color: Colors.white),))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // MyProgressPage(),
            Padding(padding: EdgeInsets.all(20.0),
              child: SizedBox(
                height: 16.0,
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .8,
                ),
              ),
            ),

            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: .7,
                strokeWidth: 8.0,
              ),
            ),

            ProgressRoute(),

          ],
        ),
      ),
    );
  }
}

class ProgressRoute extends StatefulWidget {
  @override
  _ProgressRoute createState()=> _ProgressRoute();
}

class _ProgressRoute extends State<ProgressRoute> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this,
      duration: Duration(seconds: 3),
    );
    _animationController.forward();
    _animationController.addListener(()=>setState(() {

    }));
    super.initState();
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(16.0),
            child: LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: ColorTween(begin: Colors.grey,end: Colors.blue)
              .animate(_animationController),
              value: _animationController.value,
            ),
          )
        ],
      ),
    );
  }
}






