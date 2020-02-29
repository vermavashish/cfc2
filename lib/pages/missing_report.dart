import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../pages/model/report_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

ReportUser obj = new ReportUser();

class Report extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: MissingReport(),
      theme: new ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MissingReport extends StatefulWidget {
  @override
  State createState() => new MissingReportState();
}

class MissingReportState extends State<MissingReport> {
  final primary = Color(0xff696b9e);
  final secondary = Color(0xfff29a94);
  File _photoId;
  bool isUploaded = false;
  String base64Image;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
      body: SingleChildScrollView(
          child: Container(
        //margin: EdgeInsets.all(16.0),
        //height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.baseline,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(
                      child: Text(
                        "File a Report",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Visibility(
              visible: isUploaded,
              child: Center(
                child: _photoId == null
                    ? Text("No Image")
                    : Image.file(
                        _photoId,
                        width: MediaQuery.of(context).size.width * 0.66,
                        height: MediaQuery.of(context).size.height / 3,
                      ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new RaisedButton(
                  padding: const EdgeInsets.all(16.0),
                  textColor: Colors.white,
                  color: primary,
                  child: Center(child: Text('Upload')),
                  onPressed: () {
                    _optionsDialogBox();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Text(
                "Name",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27.0,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (text) {
                  obj.name = text;
                },
                maxLines: 1,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Name",
                    prefixIcon: new Icon(Icons.question_answer)),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Text(
                "Age",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27.0,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (text) {
                  obj.age = text;
                },
                maxLines: 1,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Age",
                    prefixIcon: new Icon(Icons.question_answer)),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Text(
                "Contact",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27.0,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (text) {
                  obj.contact = text;
                },
                maxLines: 1,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Contact",
                    prefixIcon: new Icon(Icons.question_answer)),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Text(
                "Color of clothes",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27.0,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (text) {
                  obj.color = text;
                },
                maxLines: 1,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Color",
                    prefixIcon: new Icon(Icons.question_answer)),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: Text(
                "Address",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 27.0,
                    color: Colors.black),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
              child: TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                onChanged: (text) {
                  obj.address = text;
                },
                maxLines: 4,
                decoration: new InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        borderSide: new BorderSide(color: Colors.teal)),
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Address",
                    prefixIcon: new Icon(Icons.question_answer)),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                child: new RaisedButton(
                  padding: const EdgeInsets.all(16.0),
                  textColor: Colors.white,
                  color: primary,
                  child: Center(child: Text('Submit')),
                  onPressed: () async {
                    var response = await http.post(
                        "http://192.168.43.32:3000/api/insertData",
                        body: {
                          'name': obj.name,
                          'age': obj.age,
                          'contact': obj.contact,
                          'address': obj.address,
                          'color': obj.color,
                          //'lat': obj.lat.toString(),
                          //'long': obj.long.toString(),
                        });
                    print('Response status: ${response.statusCode}');
                    print('Response body: ${response.body}');
                    base64Image = base64Encode(_photoId.readAsBytesSync());
                    //String filename = _photoId.path.split("/").last;
                    var res = await http.post(
                        "http://192.168.43.32:3000/api/insertImage",
                        body: {
                          'image': base64Image,
                          'name': "${response.body}.jpg"
                        });
                    print('Response status: ${res.statusCode}');
                    print('Response body: ${res.body}');
                    Toast.show("Reported", context,
                        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                ),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
          ],
        ),
      )),
    );
  }

  Future<void> _optionsDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new SingleChildScrollView(
              child: new ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: new Text('Take a picture'),
                    onTap: () {
                      openCamera();
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  GestureDetector(
                    child: new Text('Select from gallery'),
                    onTap: () {
                      openGallery();
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  void openCamera() async {
    var camera = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      _photoId = camera;
      if (_photoId != null) isUploaded = true;
    });
  }

  Future openGallery() async {
    var gallery = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _photoId = gallery;
      if (_photoId != null) isUploaded = true;
    });
  }
}
