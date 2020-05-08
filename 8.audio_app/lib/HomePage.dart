import 'package:flutter/material.dart';
import 'numberAudio.dart';
import 'package:audioplayers/audio_cache.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioCache audioPlayer = AudioCache();

  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.red, "one"),
    NumberAudio("two.wav", Colors.blue, "two"),
    NumberAudio("three.wav", Colors.green, "three"),
    NumberAudio("four.wav", Colors.yellow, "four"),
    NumberAudio("five.wav", Colors.orange, "five"),
    NumberAudio("six.wav", Colors.purple, "six"),
    NumberAudio("seven.wav", Colors.teal, "seven"),
    NumberAudio("eight.wav", Colors.lightBlue, "eight"),
    NumberAudio("nine.wav", Colors.lightGreen, "nine"),
    NumberAudio("ten.wav", Colors.indigo, "ten"),
  ];

  play(String uri) {
    audioPlayer.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
        ),
        title: Text("Spanish Audio"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 30.0)),
              Image(image: AssetImage("images/logo.png")),
              Padding(padding: EdgeInsets.only(top: 30.0)),
              Expanded(
                child: GridView.builder(
                  physics: new NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 20.0,
                  ),
                  itemCount: numberList.length,
                  itemBuilder: (context, i) => SizedBox(
                    child: RaisedButton(
                      splashColor: Colors.transparent,
                      elevation: 7.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      color: numberList[i].buttonColor,
                      child: Text(
                        numberList[i].buttonText,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        play(numberList[i].audioUri);
                      },
                    ),
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
