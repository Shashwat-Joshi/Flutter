import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category"),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              "Electronics",
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              "Home",
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              "Sports",
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              "Gym",
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              "Clothing",
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              "Grooming",
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              "Kids",
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              "Laptops",
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              "Headphones",
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              "Women",
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              "Men",
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              "Games",
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              "Apple Store",
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
          ListTile(
            title: Text(
              "Food",
              textAlign: TextAlign.center,
            ),
          ),
          Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
