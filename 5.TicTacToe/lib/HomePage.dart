import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: link up the images
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");

  bool isCross = true;
  String message;
  List<String> gameState;
  int count = 0;

  // TODO: Initialize the state of the box as empty

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
        if (count > 4 && this.message == "") {
          checkWin();
        }
        this.isCross = !this.isCross;
      });
    }
  }

  // TODO: ResetGame Method

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

  // TODO: Get Image Method
  AssetImage getImage(String value) {
    switch (value) {
      case ('empty'):
        return edit;
        break;
      case ('Cross'):
        return cross;
        break;
      case ('Circle'):
        return circle;
        break;
    }
  }

  // TODO: check for winning logic
  checkWin() {
    if (gameState[0] != 'empty' &&
        gameState[0] == gameState[1] &&
        gameState[1] == gameState[2]) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
      });
    } else if (gameState[3] != 'empty' &&
        gameState[3] == gameState[4] &&
        gameState[4] == gameState[5]) {
      setState(() {
        this.message = "${this.gameState[3]} Wins";
      });
    } else if (gameState[6] != 'empty' &&
        gameState[6] == gameState[7] &&
        gameState[7] == gameState[8]) {
      setState(() {
        this.message = "${this.gameState[6]} Wins";
      });
    } else if (gameState[0] != 'empty' &&
        gameState[0] == gameState[3] &&
        gameState[3] == gameState[6]) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
      });
    } else if (gameState[1] != 'empty' &&
        gameState[1] == gameState[4] &&
        gameState[4] == gameState[7]) {
      setState(() {
        this.message = "${this.gameState[1]} Wins";
      });
    } else if (gameState[2] != 'empty' &&
        gameState[2] == gameState[5] &&
        gameState[5] == gameState[8]) {
      setState(() {
        this.message = "${this.gameState[2]} Wins";
      });
    } else if (gameState[0] != 'empty' &&
        gameState[0] == gameState[4] &&
        gameState[4] == gameState[8]) {
      setState(() {
        this.message = "${this.gameState[0]} Wins";
      });
    } else if (gameState[2] != 'empty' &&
        gameState[2] == gameState[4] &&
        gameState[4] == gameState[6]) {
      setState(() {
        this.message = "${this.gameState[2]} Wins";
      });
    } else if (!gameState.contains('empty')) {
      setState(() {
        this.message = "Game Draw";
      });
    }
  }

  reset() {
    if (this.message != "") {
      Timer(Duration(seconds: 2), () {
        resetGame();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.all(20.0)),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(20.0),
              physics: new NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                  ),
                ),
                height: 100.0,
                width: 100.0,
                child: MaterialButton(
                  elevation: 10.0,
                  child: Image(
                    image: this.getImage(gameState[i]),
                  ),
                  onPressed: () {
                    this.playGame(i);
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 100.0),
            child: Text(
              this.message,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          MaterialButton(
            padding: EdgeInsets.all(20.0),
            minWidth: 200,
            height: 50,
            color: Colors.purple,
            elevation: 25.0,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Text("Reset Game",
                style: TextStyle(
                  fontSize: 17.0,
                )),
            onPressed: () {
              resetGame();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.purpleAccent,
          ),
          Padding(padding: EdgeInsets.all(40.0)),
          Container(
            child: reset(),
          )
        ],
      ),
    );
  }
}
