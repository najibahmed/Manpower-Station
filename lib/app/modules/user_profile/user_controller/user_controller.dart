import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/app/services/api_client.dart';

class UserController extends BaseController {
  var userName = 'James Carlo'.obs;
  var phoneNumber = '+8801712345678'.obs;
  final profilePic = Rx<File?>(null);


  Future<void> pickImage(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    // Show a bottom sheet with options to choose between camera and gallery
    final XFile? image = await showModalBottomSheet<XFile>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text('Take a Photo'),
                onTap: () async {
                  Navigator.of(context)
                      .pop(await picker.pickImage(source: ImageSource.camera));
                },
              ),
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text('Choose from Gallery'),
                onTap: () async {
                  Navigator.of(context)
                      .pop(await picker.pickImage(source: ImageSource.gallery));
                },
              ),
            ],
          ),
        );
      },
    );

    if (image != null) {
      // Handle the picked image file (e.g. display it in an Image widget)
      profilePic.value = File(image.path);
      // Do something with the image file, like uploading or displaying it
      print('Image selected: ${image.path}');
    }
  }

  Future<void> getUserInformation() async {
    try {
      String userid = MySharedPref.getUserId().toString();
      String url =
          "http://172.16.154.43/api/clients/get/unique/client/profile/:$userid";
      await BaseClient.safeApiCall(
        url,
        RequestType.get,
        onSuccess: (response) {
          if (response.statusCode == 200) {
            Get.snackbar('Success', '${response.data['message']}');
          } else {
            Get.snackbar('Error', 'Having problem to get user data!');
          }
        },
      );
    } catch (e) {
      Get.snackbar('Error :', e.toString());
    }
  }


  Future<void> updateUserProfileField(FieldType fieldType, dynamic value) async {
    Map<String, dynamic> requestData = {
      '$fieldType' : value.toString().trim(),
    };
    try {
      String userid = MySharedPref.getUserId().toString();
      String url =
          "http://172.16.154.43/api/clients/update/client/profile/:$userid";
      await BaseClient.safeApiCall(
        url,
        RequestType.put,
        data: requestData,
        onSuccess: (response) {
          if (response.statusCode == 200) {
            Get.snackbar('Success', '${response.data['message']}');
          } else {
            Get.snackbar('Error', 'Having problem to update user data!');
          }
        },
      );
    } catch (e) {
      Get.snackbar('Error :', e.toString());
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
    super.onClose();
  }
}
enum FieldType {
  username,
  description,
  address,
  area,
  avatar_image
}