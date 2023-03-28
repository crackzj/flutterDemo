

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButtonPage extends StatelessWidget {
  MyButtonPage({Key? key,required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),actions: [
       IconButton(onPressed: (){
        Navigator.pushNamed(context, '/image');
       }, icon: Icon(Icons.arrow_forward))
      ],),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NormalButton(),
          MyTextButton(),
          MyOutlineButton(),
          MyIconButton(),
          MyButtonWithIcon(),
        ],
      ),
    );
  }
}

/**
 * ElevatedButton 漂浮按钮, 默认带有阴影和灰色背景，按下后，阴影会变大
 */
class NormalButton extends StatelessWidget {
  var onPressed = (){
   print("click elevatedButton");
};
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(onPressed: onPressed, child: Text("normal"),),
        Text("ElevatedButton 漂浮按钮, 默认带有阴影和灰色背景，按下后，阴影会变大") 
      ],
    );
  }
}

/**
 * TextButton即文本按钮，默认背景透明并不带阴影。按下后，会有背景色
 */
class MyTextButton extends StatelessWidget {
  var onPressed = (){
    print("click textButton");
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(onPressed: onPressed, child: Text("normal textbutton")),
        Text("TextButton即文本按钮，默认背景透明并不带阴影。按下后，会有背景色"),
      ],
    );
  }
}

/**
 * OutlineButton默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
 */
class MyOutlineButton extends StatelessWidget {
  var onPressed = (){
    print("click outlinebutton");
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(onPressed: onPressed, child: Text("normal outlineButton")),
        Text("OutlineButton默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)"),
      ],
    );
  }
}

/**
 * IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
 */
class MyIconButton extends StatelessWidget {
  var onPressed = (){
   print("click IconButton");
  };

  @override
  Widget build(BuildContext context) {
   return Column(
     children: [
       IconButton(onPressed: onPressed, icon: Icon(Icons.arrow_forward)),
       Text("IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景")
     ],
   );
  }
}

/**
 * 带图标的按钮
 */
class MyButtonWithIcon extends StatelessWidget {
  var onPressed = (){
    print("button clicked");
  };
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 100,
              child: ElevatedButton.icon(onPressed: onPressed, icon: Icon(Icons.send), label: Text("发送")),
            ),
            Container(
              width: 100,
              child: OutlinedButton.icon(onPressed: onPressed, icon: Icon(Icons.add), label: Text("添加")),
            ),
            Container(
              width: 100,
              child: TextButton.icon(onPressed: onPressed, icon: Icon(Icons.info), label: Text("详情")),
            )
          ],
        ),
        Text("ElevatedButton、TextButton、OutlineButton都有一个icon 构造函数，通过它可以轻松创建带图标的按钮"),
      ],
    );
  }
}