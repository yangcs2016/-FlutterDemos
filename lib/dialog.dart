import 'package:flutter/material.dart';

class Dialog extends StatefulWidget {
  @override
  DialogState createState()=>new DialogState();
}

//设置对话框点击选项
// enum MyDialogAction {
//   yes,
//   no,
//   maybe,
// }
 class Options {
  static const String yes="接受";
  static const String no="放弃";
  static const String maybe="考虑一下";
 }
//创建状态Widget
class DialogState extends State<Dialog> {
  //设置显示内容变量
  String _text = "";
  //textfield onchange事件函数，将输入值赋值给_text
  void _onChange(String value) {
    setState(() {
      _text = value;
    });
  }

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
      content: new Text(
        value,
        style: new TextStyle(fontSize: 30.0),
      ),
      //设置actions选项为FlatButton,指定事件处理函数和显示内容，并设置字号为20.0
      actions: <Widget>[
        //选项yes
        new FlatButton(
            onPressed: () {
              _dialogResult(Options.yes);
            },
            child: new Text('Yes',style: new TextStyle(fontSize:20.0),)),
            //选项no
        new FlatButton(
            onPressed: () {
              _dialogResult(Options.no);
            },
            child: new Text('No',style: new TextStyle(fontSize:20.0),)),
            //选项maybe
        new FlatButton(
            onPressed: () {
              _dialogResult(Options.maybe);
            },
            child:  new Text('Maybe',style: new TextStyle(fontSize:20.0),)),
      ],
    );
    showDialog(context: context, child: dialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Alert Dialog Demo'),
      ),
      body: new Container(
          child: new Center(
              child: new Column(
        children: <Widget>[
          new TextField(
            onChanged: (String value) {
              _onChange(value);
            },
          ),
          new RaisedButton(
            child: new Text('AlertDialog'),
            onPressed: () {
              _showAlert(_text);
            },
          ),
        ],
      ))),
    );
  }
}
