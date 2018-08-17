import 'package:flutter/material.dart';
import 'package:alertdialog/login.dart';
import 'package:alertdialog/home.dart';
import 'package:alertdialog/MyCode.dart';

//app入口函数，返回设计APP
void main() => runApp(new MaterialApp(
      home: new MyLogin(),
      routes: <String, WidgetBuilder>{
        '/MyLogin': (BuildContext context) => new MyLogin(),
        '/Home': (BuildContext context) => new Home(),
        '/MyCode': (BuildContext context) => new MyCode(),
      },
    ));
