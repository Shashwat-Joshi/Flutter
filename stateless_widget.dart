import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter App",
      theme: ThemeData(
        primaryColor: Colors.orange,
        accentColor: Colors.orangeAccent,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Hi i am line 1",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                "Hi i am line 2",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("Login"),
                autofocus: true,
                color: Colors.orange,
                splashColor: Colors.blue,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add_a_photo,
            color: Colors.white,
          ),
          splashColor: Colors.black,
        ),
      ),
    );
  }
}
