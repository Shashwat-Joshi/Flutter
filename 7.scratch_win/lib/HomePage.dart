import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: Initialize the images
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage lucky = AssetImage("images/rupee.png");
  AssetImage unlucky = AssetImage("images/sadFace.png");

  // TODO: Declaring required Variables
  List<String> gameState;
  int random;
  bool luck = false;
  String message;
  int count = 1;

  // TODO: Initializing the init gameState
  @override
  void initState() {
    super.initState();
    setState(() {
      gameState = List<String>.generate(25, (index) => "empty");
      message = "";
      generateRandomNumer();
    });
  }

  generateRandomNumer() {
    setState(() {
      random = Random().nextInt(25);
    });
  }

  // TODO: Reset Method
  resetGame() {
    setState(() {
      gameState = List<String>.filled(25, "empty");
      generateRandomNumer();
      luck = false;
      message = "";
      count = 1;
    });
  }

  // TODO: Show All Method
  showAll() {
    setState(() {
      gameState = List<String>.filled(25, "unlucky");
      gameState[random] = "lucky";
    });
  }

  // TODO: playGame Method
  playGame(int index) {
    setState(() {
      if (count < 11 && luck == false) {
        count++;
        if (index == random) {
          gameState[index] = "lucky";
          message = "You Won !!";
          luck = true;
        } else {
          gameState[index] = "unlucky";
        }
      }
      if (count == 11 && luck == false) {
        message = "Better luck next time !!";
      }
    });
  }

  // TODO: AssetImage Method
  AssetImage getImage(String value) {
    switch (value) {
      case ("lucky"):
        return lucky;
        break;
      case ("unlucky"):
        return unlucky;
        break;
    }
    return circle;
  }

  Color val() {
    if (this.message == "You Won !!") {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Scratch Win",
          style: TextStyle(fontSize: 23.0),
        ),
        backgroundColor: Colors.yellow[700],
        centerTitle: true,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.fromLTRB(20.0, 120.0, 20.0, 0.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: 25,
              itemBuilder: (context, i) => Container(
                child: RaisedButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(gameState[i]),
                  ),
                  splashColor: Colors.transparent,
                  elevation: 7.0,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 28.0),
            child: Text(
              "${this.message}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: val(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(100.0, 50.0, 100.0, 20.0),
            height: 120.0,
            child: RaisedButton(
              elevation: 7.0,
              splashColor: Colors.transparent,
              highlightColor: Colors.yellow[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              onPressed: () {
                showAll();
              },
              color: Colors.yellow[700],
              child: Text(
                "Show All",
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(100.0, 50.0, 100.0, 20.0),
            height: 120.0,
            child: RaisedButton(
              elevation: 7.0,
              splashColor: Colors.transparent,
              highlightColor: Colors.yellow[800],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              onPressed: () {
                resetGame();
              },
              color: Colors.yellow[700],
              child: Text(
                "Reset Game",
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20.0),
          ),
        ],
      ),
    );
  }
}
