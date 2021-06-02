

import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';








class Camscreen extends StatefulWidget {
  static String routeName = 'camscreen';
  @override
  _CamscreenState createState() => _CamscreenState();
}

//carrusel de spash explicativos
class _CamscreenState extends State<Camscreen> {

List _outputs;
File _image;
bool _loading = false;
CameraController _controller;
Future<void> _initializeControllerFuture;
bool isCameraReady = false;
bool showCapturedPhoto = false;
File imageFile ;
var ImagePath;


@override
void initState() {
  super.initState();
  _loading = true;
  loadModel().then((value) {
      setState(() {
        _loading = false;
        _initializeCamera();
        imageSelector();
      });
});

  
}





Future<void> _initializeCamera() async {
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  _controller = CameraController(firstCamera,ResolutionPreset.high);
  _initializeControllerFuture = _controller.initialize();
  if (!mounted) {
    return;
  }
  setState(() {
    isCameraReady = true;
  });
}

@override
void didChangeAppLifecycleState(AppLifecycleState state) {
  if (state == AppLifecycleState.resumed) {
    _controller != null
        ? _initializeControllerFuture = _controller.initialize()
        : null; //on pause camera is disposed, so we need to call again "issue is only for android"
  }
}

  File pickedImage;
  var text = '';

  bool imageLoaded = false; 
String direccion= "Carrera 5 # 6-56";

  final picker = ImagePicker();


  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(

          title: Text(
            "HomeScreen",
            textAlign: TextAlign.center,
          ),
        ),
        body: _loading
          ? Container(
        alignment: Alignment.center,
        child: CircularProgressIndicator(),
      )
          : Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _image == null ? Container() : Image.file(imageFile),
            SizedBox(
              height: 20,
            ),
            _outputs != null && _outputs.isNotEmpty
                ? Text(
              "${_outputs[0]["label"]}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                background: Paint()..color = Colors.white,
              ),
            )
                : Container()
          ],
        ),
      ),
      
    );
        
  }
  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _loading = false;
      _outputs = output;
    });
  
  }
 pickImage() async {
   imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (imageFile == null) return null;
    setState(() {
      _loading = true;
      _image = imageFile;
    });
    classifyImage(imageFile);
  }


     imageSelector() async {
   
      imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera, imageQuality: 60);
      setState(() {
      _loading = true;
      _image = imageFile;
    });

    classifyImage(imageFile);
      
    }

 
   loadModel() async {
    await Tflite.loadModel(
      
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }
    

    @override
    void dispose() {
     
    Tflite.close();
    _controller?.dispose();
    super.dispose();
  }

}



