import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage one = AssetImage("images/one.png");
  AssetImage two = AssetImage("images/two.png");
  AssetImage three = AssetImage("images/three.png");
  AssetImage four = AssetImage("images/four.png");
  AssetImage five = AssetImage("images/five.png");
  AssetImage six = AssetImage("images/six.png");

  AssetImage currentImage1;
  AssetImage currentImage2;

  @override
  void initState() {
    super.initState();
    setState(() {
      currentImage1 = one;
      currentImage2 = one;
    });
  }

  void rollDice() {
    int rnd1 = (Random().nextInt(6)) + 1;
    int rnd2 = (Random().nextInt(6)) + 1;

    AssetImage newImage1;
    AssetImage newImage2;

    switch (rnd1) {
      case 1:
        newImage1 = one;
        break;
      case 2:
        newImage1 = two;
        break;
      case 3:
        newImage1 = three;
        break;
      case 4:
        newImage1 = four;
        break;
      case 5:
        newImage1 = five;
        break;
      case 6:
        newImage1 = six;
        break;
    }

    switch (rnd2) {
      case 1:
        newImage2 = one;
        break;
      case 2:
        newImage2 = two;
        break;
      case 3:
        newImage2 = three;
        break;
      case 4:
        newImage2 = four;
        break;
      case 5:
        newImage2 = five;
        break;
      case 6:
        newImage2 = six;
        break;
    }

    setState(() {
      currentImage1 = newImage1;
      currentImage2 = newImage2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF3B431),
        title: Text("Dice Roller"),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        elevation: 10.0,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image(
                    image: currentImage1,
                    height: 150.0,
                    width: 150.0,
                  ),
                  Image(
                    image: currentImage2,
                    height: 150.0,
                    width: 150.0,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 100.0,
                ),
                child: RaisedButton(
                  highlightColor: Colors.yellow[800],
                  // hoverColor: Colors.red,
                  onPressed: rollDice,
                  padding: EdgeInsets.fromLTRB(50.0, 25.0, 50.0, 25.0),
                  child: Text('Roll Dices'),
                  elevation: 20.0,
                  color: Color(0xFFF3B431),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
