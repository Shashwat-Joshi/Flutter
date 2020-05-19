import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyButton(),
  ));
}

class MyButton extends StatefulWidget {
  @override
  MyButtonState createState() {
    return MyButtonState();
  }
}

class MyButtonState extends State<MyButton> {
  int counter = 0;
  List<String> spanishNumbers = [
    "1 - uno",
    "2 - dos",
    "3 - tres",
    "4 - cuatro",
    '5 - cinco',
    "6 - sies",
    "7 - siete",
    "8 - ocho",
    "9 - nueve",
    "10 - diez"
  ];
  String defaultText = "Spanish numbers";

  void displaySnumbers() {
    setState(() {
      defaultText = spanishNumbers[counter];
      if (counter < 9) {
        counter++;
      } else {
        counter = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Spanish numbers"),
          backgroundColor: Colors.purple[400],
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("$defaultText", style: TextStyle(fontSize: 25.0)),
                Padding(padding: EdgeInsets.all(10.0)),
                RaisedButton(
                  onPressed: displaySnumbers,
                  child: Text("Call Numbers"),
                  color: Colors.teal[300],
                  splashColor: Colors.teal[400],
                  elevation: 10.0,
                )
              ],
            ),
          ),
        ));
  }
}
