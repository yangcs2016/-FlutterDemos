import 'package:flutter/material.dart';
import 'package:alertdialog/dialog.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyloginState createState() => new _MyloginState();
}

class _MyloginState extends State<MyLogin> {
  var leftRightPadding = 50.0;
  var topBottomPadding = 4.0;
  var textTips = new TextStyle(fontSize: 16.0, color: Colors.black);
  var hintTips = new TextStyle(fontSize: 15.0, color: Colors.black26);
  static const LOGO = "images/zpmc.png";
  var _userPassController = new TextEditingController();
  var _userNameController = new TextEditingController();

//对话框点击事件，将对话框选项值传入，打印点击结果，关闭对话框
  void _dialogResult(String value) {
    print('You Selectd $value');
    //点击后关闭对话框
    Navigator.pop(context);
  }

  //Alert处理事件函数，将textField输入值传入，
  void _showAlert(String value) {
    //没有输入值，直接返回不处理
    if (value.isEmpty) return;
    //创建AlertDialog对话框
    AlertDialog dialog = new AlertDialog(
      //设置对话框内容content为传入值，样式style为字号30.0
      title: new Text("登陆",style: new TextStyle(fontSize: 30.0),),      
      content: new Center(
        widthFactor: 0.1,
        heightFactor: 0.01,
        child: new Text(
          value,
          style: new TextStyle(fontSize: 20.0),
        ),
      ),
      //设置actions选项为FlatButton,指定事件处理函数和显示内容，并设置字号为20.0
      actions: <Widget>[
        //选项yes
        new FlatButton(
            onPressed: () {
              _dialogResult(Options.yes);
              // Navigator.pushNamed(context, '/Home');
            },
            child: new Text(
              '关闭',
              style: new TextStyle(fontSize: 20.0),
            )),
      ],
    );
    showDialog(context: context, child: dialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("登录", style: new TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: new IconThemeData(color: Colors.white),
      ),
      body: new Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.fromLTRB(
                leftRightPadding, 50.0, leftRightPadding, 10.0),
            child: new Image.asset(LOGO),
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(
                leftRightPadding, 50.0, leftRightPadding, topBottomPadding),
            child: new TextField(
              style: hintTips,
              controller: _userNameController,
              decoration: new InputDecoration(hintText: "请输入用户名"),
              obscureText: false,
            ),
          ),
          new Padding(
            padding: new EdgeInsets.fromLTRB(
                leftRightPadding, 30.0, leftRightPadding, topBottomPadding),
            child: new TextField(
              style: hintTips,
              controller: _userPassController,
              decoration: new InputDecoration(hintText: "请输入用户密码"),
              obscureText: true,
            ),
          ),
          new Container(
            width: 360.0,
            margin: new EdgeInsets.fromLTRB(10.0, 40.0, 10.0, 0.0),
            padding: new EdgeInsets.fromLTRB(leftRightPadding, topBottomPadding,
                leftRightPadding, topBottomPadding),
            child: new Card(
              color: Colors.green,
              elevation: 6.0,
              child: new FlatButton(
                onPressed: () {
                  if (_userNameController.text == 'yangchunsong' &&
                      _userPassController.text == '123456') {
                    _showAlert("登录成功！");
                  } else {
                    _showAlert("登录失败！");
                  }
                },
                child: new Padding(
                  padding: new EdgeInsets.all(10.0),
                  child: new Text(
                    '马上登录',
                    style: new TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
