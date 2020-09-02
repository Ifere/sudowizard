import 'dart:async';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

//TODO get right proportions with media query for different devices

//double width = MediaQuery.of(context).size.width;


class CapturePage extends StatefulWidget {
  @override
  _CapturePageState createState() => _CapturePageState();
}

class _CapturePageState extends State<CapturePage> {

  List<CameraDescription> cameras;
  CameraDescription camera;
  CameraController _controller;
  bool _isReady = false;
  bool _imageTaken = false;
  String fileName;
  String filePath = "empty";
  bool fromGallery = false;


  CameraController controller;
  int selectedCameraIdx;
  String imagePath;




  Future<void> _setupCameras() async {
    try {
      cameras = await availableCameras();
      if (cameras.isEmpty) {
//        return _navigator.navigateBack();
      }
      camera = cameras.first;
      _controller = CameraController(camera, ResolutionPreset.ultraHigh);
      await _controller.initialize();
      setState(() {
        _isReady = true;
      });
    } on CameraException catch (e, stack) {
//      _navigator.navigateBack();
      print(e);
      print(stack);
    }
  }



  Future _openGallery() {
    File imageFile;
    final picker = FilePicker.getFilePath(
        type: FileType.image
    );
    bool validFilePathFlag = false;
    picker.then((String result) {
      setState(() {
        if (result != null) {
          validFilePathFlag = true;
          fromGallery = true;
          filePath = result;

        }
        else {
          filePath = "invalidFilePath";
        }

      });

    });


  }

  Future _openCamera() async {

  }


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
                    icon: Icon(
                        Icons.clear,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },

                  ),
                  IconButton(
                    icon: Icon(
                        Icons.flash_on,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },

                  ),

                ],
              ),
            ),
            SizedBox(
              height: (size.height * 0.15),
            ),

            Center(
              child: Container(
                height: (size.height * 0.52),
                width: size.width,
                color: Colors.white,
                child: fromGallery ? Image.file(
                    File(filePath),
                  fit: BoxFit.cover,


                  )
                  
                 : CameraView(),
              ),

            ),
            SizedBox(
              height: (size.height * 0.05),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: _openGallery,
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF46B9D1),
                    radius: 20,
                    child: Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),

                  ),
                ),
                RawMaterialButton(
                  onPressed: () async {
                    // Take the Picture in a try / catch block. If anything goes wrong,
                    // catch the error.
                    try {
                      // Ensure that the camera is initialized.
                      await controller.initialize();

                      // Construct the path where the image should be saved using the
                      // pattern package.
                      final path = join(
                        // Store the picture in the temp directory.
                        // Find the temp directory using the `path_provider` plugin.
                        (await getTemporaryDirectory()).path,
                        '${DateTime.now()}.png',
                      );

                      // Attempt to take a picture and log where it's been saved.
                      await _controller.takePicture(path);

                      // If the picture was taken, display it on a new screen.

                    } catch (e) {
                      // If an error occurs, log the error to the console.
                      print(e);
                    }
                  },
                  child: CircleAvatar(
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 20,
                    ),
                    backgroundColor: Color(0xFFA6D9E4),
                    radius: 30,

                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    print('pressed');
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xFF46B9D1),
                    radius: 20,
                    child: Icon(
                      Icons.check,
                      size: 30,
                      color: Colors.white,
                    ),

                  ),
                )
              ],

            ),
            SizedBox(
              height: (size.height * 0.10),
            ),
          ],
        ),

//
      ),
    );
  }
}

class CameraView extends StatefulWidget {
  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  List cameras;
  CameraController controller;
  int selectedCameraIdx;
  String imagePath;

  // 1, 2
  Future _initCameraController(CameraDescription cameraDescription) async {
    if (controller != null) {
      await controller.dispose();
    }

    // 3
    controller = CameraController(cameraDescription, ResolutionPreset.high);

    // If the controller is updated then update the UI.
    // 4
    controller.addListener(() {
      // 5
      if (mounted) {
        setState(() {});
      }

      if (controller.value.hasError) {
        print('Camera error ${controller.value.errorDescription}');
      }
    });

    // 6
    try {
      await controller.initialize();
    } on CameraException catch (e) {
      print(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  Widget _cameraPreviewWidget() {
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }



    return AspectRatio(
            aspectRatio: 1,
            child: ClipRect(
              child: Transform.scale(
                scale: 1 / controller.value.aspectRatio,
                child: Center(
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: CameraPreview(controller),
                  ),
                ),
              ),
            ),
          );
  }



  @override
  void initState() {
    super.initState();
    // 1
    availableCameras().then((availableCameras) {

      cameras = availableCameras;
      if (cameras.length > 0) {
        setState(() {
          // 2
          selectedCameraIdx = 0;
        });

        _initCameraController(cameras[selectedCameraIdx]).then((void v) {

        });
        return AspectRatio(
          aspectRatio: 1,
          child: ClipRect(
            child: Transform.scale(
              scale: 1 / controller.value.aspectRatio,
              child: Center(
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: CameraPreview(controller),
                ),
              ),
            ),
          ),
        );       }else{
        return Center(child: CircularProgressIndicator(),);
      }
    }).catchError((err) {
      // 3
      print('Error: $err.code\nError Message: $err.message');
    });
  }



  @override
  Widget build(BuildContext context) {
    return _cameraPreviewWidget();
  }
}
