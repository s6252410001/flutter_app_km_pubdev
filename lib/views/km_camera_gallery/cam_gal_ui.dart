import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CamGalUI extends StatefulWidget {
  const CamGalUI({ Key? key }) : super(key: key);

  @override
  _CamGalUIState createState() => _CamGalUIState();
}

class _CamGalUIState extends State<CamGalUI> {


  //ตัวแปรเก็บรูป
  File? imageSelectedUse;


  //เปิดกล้อง
  Future selectImgFromCamera() async {
    final imageSelect = await ImagePicker().pickImage(
      source: ImageSource.camera
      
    );
    //ตรวจสอบว่าเลือกไหม
    if (imageSelect == null){
        return;
      }
    //กรณีเลือกรูป
    final imageSelectPath = File(imageSelect.path);
    setState(() {
      imageSelectedUse =  imageSelectPath;
    });
  }





  //เปิดแกลอรี่
  selectImgFromGallery() async{
    final imageSelect = await ImagePicker().pickImage(
      source: ImageSource.gallery
    );
    if (imageSelect == null){
        return;
      }
    //กรณีเลือกรูป
    final imageSelectPath = File(imageSelect.path);
    setState(() {
      imageSelectedUse =  imageSelectPath;
      });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CamGal KM'
        ),
        centerTitle: true,
      ),
      
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 60.0,
              ),
              CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.lightGreen,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    100.0,
                  ),
                  child:
                   imageSelectedUse == null ?
                   Image.asset(
                    'assets/images/logo.png',
                    width: 180.0,
                    height: 180.0,
                    fit: BoxFit.cover,
                  )
                  :
                  Image.file(
                    File(imageSelectedUse!.path),
                    width: 180.0,
                    height: 180.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: (){
                      selectImgFromCamera();
                    },
                    icon: Icon(
                      Icons.camera_alt
                    ),
                    label: Text(
                      'Camera'
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  ElevatedButton.icon(
                    onPressed: (){
                      selectImgFromGallery();
                    },
                    icon: Icon(
                      Icons.camera
                    ),
                    label: Text(
                      'Gallery'
                    ),
                  ),
                
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}