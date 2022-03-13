import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class preCamera extends StatefulWidget {
  preCamera({Key? key}) : super(key: key);

  @override
  State<preCamera> createState() => _preCameraState();
}

class _preCameraState extends State<preCamera> {
  File? image;


  @override
  Widget build(BuildContext context) {

    Future _openCamera() async {
      try{
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if(image == null) return;

      final imageTemporary = File(image.path);
      setState(()=>this.image = imageTemporary);
      } on PlatformException catch (e) {
        print('Failed to pick image: $e');
      }
    }

    final botonCamara = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.blueAccent,
      child: MaterialButton(
        padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
        height: 30,
        onPressed: () {
          _openCamera();
        },
        child: Column(
          children: [
            Icon(Icons.camera, color: Colors.white),
            Text(
              "Take a pic",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 400,
          height: 400,
          alignment: AlignmentDirectional.center,
          padding: EdgeInsets.only(bottom: 20, top: 20),
          child: image != null ? Image.file(image!) : Text("no picture taken"),
        ),
        botonCamara,
      ],
    );
  }

  
}


