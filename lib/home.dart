
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  MyHome createState()=>new MyHome();
}

class MyHome extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title:new Text("Home"),
      ),
      body: Text("Home Page"),
    );
  }
}