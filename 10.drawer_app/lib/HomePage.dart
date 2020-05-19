import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer App"),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      extendBodyBehindAppBar: true,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Shashwat"),
              accountEmail: Text("shashwat2002joshi@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Text("SJ"),
                backgroundColor: Colors.orange,
              ),
            ),
            ListTile(
              title: Text("Profile"),
              onTap: () {
                Navigator.of(context).pushNamed("/b");
              },
            ),
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: Text("Category"),
              onTap: () {
                Navigator.of(context).pushNamed("/a");
              },
            ),
            Divider(
              thickness: 0.5,
            ),
            ListTile(
              title: Text("Mascot"),
              onTap: () {
                Navigator.of(context).pushNamed("/c");
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text("Home Page"),
      ),
    );
  }
}
