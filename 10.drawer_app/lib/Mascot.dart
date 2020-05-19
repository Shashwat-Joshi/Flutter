import 'package:flutter/material.dart';

class Mascot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(padding: EdgeInsets.all(80.0)),
        Text(
          "MASCOT",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            decoration: TextDecoration.none,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(75.0),
        ),
        Center(
          child: Image(
            image: AssetImage("images/logo.png"),
          ),
        ),
        Padding(padding: EdgeInsets.only(bottom: 150.0)),
        FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Icon(Icons.arrow_back),
        )
      ],
    );
  }
}
