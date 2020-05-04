import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AssetImage edit = AssetImage("images/edit.png");
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");

  String message;
  List<String> gameState;
  bool isCross = true;
  int count = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      gameState = [
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
      message = "";
    });
  }

  playGame(index) {
    if (this.gameState[index] == "empty" && this.message == "") {
      setState(() {
        if (this.isCross) {
          gameState[index] = "Cross";
        } else {
          gameState[index] = "Circle";
        }
        count++;
        if (count > 4) {
          checkWin();
        }
        this.isCross = !this.isCross;
        // if you want to reset automatically if a player Wins
        if (this.message.isNotEmpty) {
          Timer(Duration(seconds: 2), () {
            resetGame();
          });
        }
      });
    }
  }

  resetGame() {
    setState(() {
      gameState = [
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
      message = "";
    });
  }

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

  checkWin() {
    if (gameState[0] != "empty" &&
        gameState[0] == gameState[1] &&
        gameState[1] == gameState[2]) {
      setState(() {
        this.message = "${gameState[0]} Wins";
      });
    } else if (gameState[3] != "empty" &&
        gameState[3] == gameState[4] &&
        gameState[4] == gameState[5]) {
      setState(() {
        this.message = "${gameState[3]} Wins";
      });
    } else if (gameState[6] != "empty" &&
        gameState[6] == gameState[7] &&
        gameState[7] == gameState[8]) {
      setState(() {
        this.message = "${gameState[6]} Wins";
      });
    } else if (gameState[0] != "empty" &&
        gameState[0] == gameState[3] &&
        gameState[3] == gameState[6]) {
      setState(() {
        this.message = "${gameState[0]} Wins";
      });
    } else if (gameState[1] != "empty" &&
        gameState[1] == gameState[4] &&
        gameState[4] == gameState[7]) {
      setState(() {
        this.message = "${gameState[1]} Wins";
      });
    } else if (gameState[2] != "empty" &&
        gameState[2] == gameState[5] &&
        gameState[5] == gameState[8]) {
      setState(() {
        this.message = "${gameState[2]} Wins";
      });
    } else if (gameState[0] != "empty" &&
        gameState[0] == gameState[4] &&
        gameState[4] == gameState[8]) {
      setState(() {
        this.message = "${gameState[0]} Wins";
      });
    } else if (gameState[2] != "empty" &&
        gameState[2] == gameState[4] &&
        gameState[4] == gameState[6]) {
      setState(() {
        this.message = "${gameState[2]} Wins";
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
          style: TextStyle(fontSize: 25.0),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[700],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.fromLTRB(20.0, 150.0, 20.0, 20.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: this.gameState.length,
              itemBuilder: (context, i) => Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5),
                ),
                child: MaterialButton(
                  onPressed: () {
                    this.playGame(i);
                  },
                  child: Image(
                    image: getImage(this.gameState[i]),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 110.0),
            child: Text(
              "${this.message}",
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: val(),
              ),
            ),
          ),
          Container(
            width: 200.0,
            height: 50.0,
            child: MaterialButton(
              onPressed: () {
                resetGame();
              },
              color: Colors.teal,
              child: Text(
                "Reset Game",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40.0),
              ),
              elevation: 10.0,
              splashColor: Colors.transparent,
              highlightColor: Colors.teal[800],
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
