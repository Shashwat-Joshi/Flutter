import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;

  Future _openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  Future _openGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future<void> _showDialog() async {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            insetAnimationDuration: Duration(seconds: 3),
            title: Text("Choose Picture from :-"),
            content: Text(
                "Select Picture either from internal Storage (Gallery) or Camera"),
            actions: <Widget>[
              CupertinoDialogAction(
                child: Text("Open Camera"),
                onPressed: () {
                  _openCamera();
                  Navigator.of(context, rootNavigator: true).pop(true);
                },
              ),
              CupertinoDialogAction(
                child: Text("Open Gallery"),
                onPressed: () {
                  _openGallery();
                  Navigator.of(context, rootNavigator: true).pop(true);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera App"),
        centerTitle: true,
        shape: StadiumBorder(),
        elevation: 0.0,
      ),
      body: Center(
        child: Container(
          height: 700.0,
          width: 650.0,
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 70.0),
          child: Center(
            child: _image == null
                ? Text(
                    "No Image",
                    textAlign: TextAlign.center,
                  )
                : Image.file(_image),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 60.0,
        width: 60.0,
        child: FittedBox(
          child: FloatingActionButton(
            child: Icon(Icons.add_a_photo),
            onPressed: () {
              _showDialog();
            },
          ),
        ),
      ),
    );
  }
}
