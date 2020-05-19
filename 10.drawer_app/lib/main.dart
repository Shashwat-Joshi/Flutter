import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Category.dart';
import 'Profile.dart';
import 'Mascot.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        accentColor: Colors.teal,
      ),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => Category(),
        "/b": (BuildContext context) => Profile(),
        "/c": (BuildContext context) => Mascot(),
      },
    );
  }
}
