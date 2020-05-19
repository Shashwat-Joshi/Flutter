import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 170.0),
          ),
          Center(
            child: CircleAvatar(
              child: Text(
                "SJ",
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
              backgroundColor: Colors.orange,
              minRadius: 70.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 60.0),
          ),
          Text(
            "Shashwat Joshi",
            style: TextStyle(
              fontSize: 25.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 60.0),
          ),
          Text(
            "shashwat2002joshi@gmail.com",
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.blue,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 93.0),
          ),
          Expanded(
            child: Image(
              image: AssetImage("images/logo.png"),
            ),
          ),
          Text(
            "Support us by rating in playstore",
            style: TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
              decorationColor: Colors.black,
            ),
          ),
          Padding(padding: EdgeInsets.only(bottom: 30.0))
        ],
      ),
    );
  }
}
