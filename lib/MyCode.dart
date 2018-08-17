
import 'package:flutter/material.dart';

class MyCode extends StatefulWidget {
  @override
  MyCodeState createState()=>new MyCodeState();
}

class MyCodeState extends State<MyCode> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:new Text("Code"),
      ),
      body: Text("Code Page"),
    );
  }
}