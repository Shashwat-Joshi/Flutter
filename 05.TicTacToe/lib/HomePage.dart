import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: Initialize the asset images
  AssetImage edit = AssetImage("images/edit.png");
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");

  // TODO: Declare required data types
  String message;
  List<String> gameState;
  bool isCross = true;
  int count = 0;

  // TODO: Initial state of the game
  @override
  void initState() {
    super.initState();
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  // TODO: playGame Method
  playGame(int index) {
    if (this.gameState[index] == "empty" && this.message == "") {
      setState(() {
        if (this.isCross) {
          this.gameState[index] = "Cross";
        } else {
          this.gameState[index] = "Circle";
        }
        count++;
        if (count > 4) {
          checkWin();
        }
        this.isCross = !this.isCross;
        // If you want to automatically reset the game if someone wins
        // if (this.message != "") {
        //   Timer(Duration(seconds: 3), () {
        //     resetGame();
        //   });
        // }
      });
    }
  }

  // TODO: Reset Game
  resetGame() {
    setState(() {
      this.gameState = [
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
        "empty",
      ];
      this.message = "";
    });
  }

  // TODO: Get image method
  AssetImage getImage(String value) {
    switch (value) {
      case ("empty"):
        return edit;
        break;
      case ("Cross"):
        return cross;
        break;
      case ("Circle"):
        return circle;
        break;
    }
  }

  // TODO: Winning Logic
  checkWin() {
    if (gameState[0] != "empty" &&
        gameState[0] == gameState[1] &&
        gameState[1] == gameState[2]) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
      });
    } else if (gameState[3] != "empty" &&
        gameState[3] == gameState[4] &&
        gameState[4] == gameState[5]) {
      setState(() {
        this.message = "${this.gameState[3]} Wins";
      });
    } else if (gameState[6] != "empty" &&
        gameState[6] == gameState[7] &&
        gameState[7] == gameState[8]) {
      setState(() {
        this.message = "${this.gameState[6]} Wins";
      });
    } else if (gameState[0] != "empty" &&
        gameState[0] == gameState[3] &&
        gameState[3] == gameState[6]) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
      });
    } else if (gameState[1] != "empty" &&
        gameState[1] == gameState[4] &&
        gameState[4] == gameState[7]) {
      setState(() {
        this.message = "${this.gameState[1]} Wins";
      });
    } else if (gameState[2] != "empty" &&
        gameState[2] == gameState[5] &&
        gameState[5] == gameState[8]) {
      setState(() {
        this.message = "${this.gameState[2]} Wins";
      });
    } else if (gameState[0] != "empty" &&
        gameState[0] == gameState[4] &&
        gameState[4] == gameState[8]) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
      });
    } else if (gameState[2] != "empty" &&
        gameState[2] == gameState[4] &&
        gameState[4] == gameState[6]) {
      setState(() {
        this.message = "${this.gameState[2]} Wins";
      });
    } else if (!gameState.contains("empty")) {
      setState(() {
        this.message = "It's a Draw !!";
      });
    }
  }

  Color val() {
    if (this.message == "Cross Wins") {
      return Colors.red;
    } else if (this.message == "Circle Wins") {
      return Colors.green;
    } else if (this.message == "It's a Draw !!") {
      return Colors.blue;
    } else {
      return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tic Tac Toe",
          style: TextStyle(
            fontSize: 23.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 100.0)),
          Expanded(
            child: GridView.builder(
              physics: new NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0),
                ),
                height: 50.0,
                width: 50.0,
                child: MaterialButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: this.getImage(gameState[i]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 120.0),
            child: Text(
              "${this.message}",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
                color: val(),
              ),
            ),
          ),
          Container(
            // padding: EdgeInsets.only(bottom: 50.0),
            height: 50,
            width: 200,
            child: MaterialButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.yellow[600],
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Text(
                "Reset Game",
                style: TextStyle(fontSize: 17.0),
              ),
              color: Colors.yellow[700],
              onPressed: () {
                resetGame();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 50.0),
          )
        ],
      ),
    );
  }
}
