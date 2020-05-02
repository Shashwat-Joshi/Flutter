import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bg Changer",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Background Changer"),
          backgroundColor: Colors.teal[400],
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var colors = [
    Colors.amber,
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.green,
    Colors.red,
    Colors.pink,
    Colors.orange,
    Color(0xFF2B2B52)
  ];
  var defaultColor = Color(0xFF1287A5);
  var defColor = Colors.black;

  setRandomColor() {
    setState(() {
      var rnd = Random().nextInt(8);
      var secondRnd = Random().nextInt(8);
      defaultColor = colors[rnd];
      defColor = colors[secondRnd];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: defaultColor,
      child: Center(
        child: Container(
          height: 100.0,
          width: 200.0,
          child: RaisedButton(
            textColor: Colors.white,
            child: Text("Change bg"),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            onPressed: setRandomColor,
            color: defColor,
            autofocus: true,
            elevation: 100.0,
          ),
        ),
      ),
    );
  }
}
