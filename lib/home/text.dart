
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SimpleText(),
        StyleText(),
        SpanText(),
        MyDefaulTextStyle(),
      ],
    );
  }
}

class SimpleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("左对齐文本", textAlign: TextAlign.left,),
        Text("重复文本，最大行数，超出显示"*3,maxLines: 1,overflow: TextOverflow.ellipsis,),
        Text("放大文本",textScaleFactor: 1.5,)
      ],
    );
  }
}

class StyleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("hello world",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 18.0,
            height: 1.2,
            fontFamily: "Courier",
            background: Paint()..color=Colors.yellow,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dashed
          ),
        )
      ],
    );
  }
}

class SpanText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
            children: [
              TextSpan(text: "文本片段: "),
              TextSpan(
                text: "https://baidu.com",
                style: TextStyle(
                  color: Colors.blue,
                )
              )
            ]
          )),
        ],
      ),
    );
  }
}

class MyDefaulTextStyle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16.0),
      child: DefaultTextStyle(
          style: TextStyle(
            color: Colors.red,
            fontSize: 20.0,
          ),textAlign: TextAlign.start ,child: Column(
        children: [
          Text("hello world!"),
          Text("I am Jack"),
          Text("I am Jack", style: TextStyle(
            inherit: false, //不继承默认样式
            color: Colors.blue,
          ),)
        ],
      ))
    );
  }
}

