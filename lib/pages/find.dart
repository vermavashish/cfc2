import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../pages/model/report_model.dart';
import 'package:http/http.dart' as http;
import '../services/calls_and_messages_service.dart';
import '../services/service_locator.dart';

class Find extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: FindPeople(),
      theme: new ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FindPeople extends StatefulWidget {
  @override
  State createState() => FindPeopleState();
}

class FindPeopleState extends State<FindPeople> {
  File _photoId;
  bool isAvailable;
  String base64Image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    openCamera();
  }

  void openCamera() async {
    var camera = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _photoId = camera;
    });
    if (camera != null) checkData();
  }

  void checkData() async {
    base64Image = base64Encode(_photoId.readAsBytesSync());
    var res = await http.post("http://192.168.43.32:3000/api/searchForPerson",
        body: {'image': base64Image});
    print('Response status: ${res.statusCode}');
    print('Response body: ${res.body}');
    setState(() {
      isAvailable = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
    final primary = Color(0xff696b9e);
    final String number = "9483033085";
    // TODO: implement build
    if (isAvailable == false) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: <Widget>[
              new SizedBox(height: 200.0),
              new Container(
                child: Image.asset('assets/nodata.png'),
              ),
              new SizedBox(height: 40.0),
              new RaisedButton(
                onPressed: () {
                  //Navigator.pop(context);
                },
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                elevation: 20.0,
                child: Text("Back",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
                color: primary,
                colorBrightness: Brightness.light,
              )
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        // backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          title: Text("Found"),
          backgroundColor: primary,
          elevation: 0,
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      stops: [
                    0.5,
                    0.9
                  ],
                      colors: [
                    Colors.deepPurple.shade400,
                    Colors.deepPurple.shade300
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _service.call(number);
                        },
                        child: CircleAvatar(
                          child: Icon(
                            Icons.call,
                            size: 30.0,
                          ),
                          minRadius: 30.0,
                          backgroundColor: Color(0Xffea728c),
                        ),
                      ),
                      CircleAvatar(
                        minRadius: 60,
                        backgroundColor: Color(0Xffea728c),
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/user.png"),
                          minRadius: 50,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _service.sendSms(number);
                        },
                        child: CircleAvatar(
                          child: Icon(
                            Icons.message,
                            size: 30.0,
                          ),
                          minRadius: 30.0,
                          backgroundColor: Color(0Xffea728c),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Ashish Verma",
                    style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                "Contact",
                style: TextStyle(color: Color(0Xffea728c), fontSize: 16.0),
              ),
              subtitle: Text(
                "9483033085",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Address",
                style: TextStyle(color: Color(0Xffea728c), fontSize: 16.0),
              ),
              subtitle: InkWell(
                onTap: () {
                  _service.openGmap("13.089122", "77.484726");
                },
                child: Text(
                  "Bangalore",
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Age",
                style: TextStyle(color: Color(0Xffea728c), fontSize: 16.0),
              ),
              subtitle: Text(
                "21",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Clothes Description",
                style: TextStyle(color: Color(0Xffea728c), fontSize: 16.0),
              ),
              subtitle: Text(
                "Red",
                style: TextStyle(fontSize: 18.0),
              ),
            ),
            Divider(),
          ],
        ),
      );
    }
  }
}
