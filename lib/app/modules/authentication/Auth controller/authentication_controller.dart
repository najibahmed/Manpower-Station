import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';

class AuthenticationController extends BaseController{

  TextEditingController phoneNumberController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController otpController=TextEditingController();
   RxBool showError = false.obs;
  final profilePic=Rx<File?>(null);

  Future<void> pickImage(BuildContext context) async {
    final ImagePicker _picker = ImagePicker();

    // Show a bottom sheet with options to choose between camera and gallery
    final XFile? image = await showModalBottomSheet<XFile>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('Take a Photo'),
                onTap: () async {
                  Navigator.of(context).pop(await _picker.pickImage(source: ImageSource.camera));
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Choose from Gallery'),
                onTap: () async {
                  Navigator.of(context).pop(await _picker.pickImage(source: ImageSource.gallery));
                },
              ),
            ],
          ),
        );
      },
    );

    if (image != null) {
      // Handle the picked image file (e.g., display it in an Image widget)
      profilePic?.value = File(image.path);
      // Do something with the image file, like uploading or displaying it
      print('Image selected: ${image.path}');
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    phoneNumberController;
    nameController;
    otpController;
    super.onClose();
  }

}