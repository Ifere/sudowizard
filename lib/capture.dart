import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CapturePage extends StatefulWidget {
  @override
  _CapturePageState createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {
  File imageFile;
  final picker = ImagePicker();


  Future _openGallery() async {
     final pickedFile = await picker.getImage(source: ImageSource.gallery);

      setState(() {
        imageFile = File(pickedFile.path);
      });

  }

  Future _openCamera () async {

      final pickedFile = await picker.getImage(source: ImageSource.camera);

      setState(() {
        imageFile = File(pickedFile.path);
      });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF46A1DD), Color(0xFF35A9C1)])),
          child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          Navigator.pop(context);
                        },

                      ),
                      IconButton(
                        icon: Icon(Icons.flash_on),
                        onPressed: () {
                          Navigator.pop(context);
                        },

                      ),

                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),

                Center(
                    child: Container(
                      height: 400,
                      width: 300,
                      color: Colors.white,
                        ),

                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    RawMaterialButton(
                      onPressed: _openGallery,
                      child: CircleAvatar(
                        backgroundColor: Colors.white70,
                        radius: 20,
                        child: Icon(
                          Icons.add,
                          size: 30,
                          color: Colors.white,
                        ),

                          ),
                    ),
                    RawMaterialButton(
                      onPressed: _openCamera,
                      child: CircleAvatar(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                        ),
                        backgroundColor: Colors.white70,
                        radius: 30,

                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () {
                        print('pressed');
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.white70,
                        radius: 20,
                        child: Icon(
                          Icons.check,
                          size: 30,
                          color: Colors.white,
                        ),

                      ),
                    )
                  ],

                )
  ],
),

//
      ),
    );
  }
}

