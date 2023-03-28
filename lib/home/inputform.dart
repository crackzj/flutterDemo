
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("input & form"),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, "/progress");
          }, icon: Icon(Icons.arrow_forward))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginState(),
            MyInputOnchange(),
            MyInputController(),
            Padding(padding: EdgeInsets.only(top: 20.0,bottom: 20.0),child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text("form",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                )
              ],
            ),),
            FormTestRoute(),
          ],
        ),
      ),


    );
  }
}

class LoginState extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

/// 获取input输入内容（监听文本改变）
/// 1. 通过 onChange 触发获取，
/// 2。 通过 controller 直接获取,下面代码是通过 controller 获取
class _LoginState extends State<LoginState> {

  TextEditingController _unameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _unameController.addListener(() {
        print(_unameController.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          autofocus: true,
          keyboardType: TextInputType.phone,
          controller: _unameController,
          decoration: InputDecoration(
            labelText: "用户名",
            hintText: "用户名或邮箱",
            prefixIcon: Icon(Icons.person)
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "密码",
            hintText: "您的登录密码",
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        ),
      ],
    );
  }

}

/// input onchange
class MyInputOnchange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: '测试onchange',
            hintText: '测试onchange',
            prefixIcon: Icon(Icons.person),
          ),
          onChanged: (val){
            print(val);
          },
        ),
      ],
    );
  }
}

/// input controller 使用
class MyInputController extends StatefulWidget {
  _MyInputController createState() => _MyInputController();
}

class _MyInputController extends State<MyInputController> {

  TextEditingController _editingController = TextEditingController();

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    _editingController.text = "hello world";
    _editingController.selection = TextSelection(baseOffset: 2, extentOffset: _editingController.text.length);
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: "测试controller",
            hintText: "测试controller",
            prefixIcon: Icon(Icons.search),
          ),
          controller: _editingController,
        ),
      ],
    );
  }
}

///Form继承自StatefulWidget对象，它对应的状态类为FormState
class FormTestRoute extends StatefulWidget {
  _FormTestRouteState createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            controller: _unameController,
            decoration: InputDecoration(
              labelText: "user",
              hintText: "username or email",
              icon: Icon(Icons.person),
            ),
            validator: (v){
              return v!.trim().isNotEmpty ? null : "username or email can't be empty!";
            },
          ),
          TextFormField(
            controller: _pwdController,
            decoration: InputDecoration(
              labelText: "password",
              hintText: "input password",
              icon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (v){
              return v!.trim().length > 5 ? null : "password limit 6";
            },
          ),
          Padding(padding: EdgeInsets.only(top: 28.0),
            child: Row(
              children: [
                Expanded(child: ElevatedButton(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text("login"),
                  ),
                  onPressed: (){
                    if((_formKey.currentState as FormState).validate()){

                    }
                  },
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}