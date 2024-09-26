
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/app/modules/service/model/address_model.dart';
import 'package:manpower_station/app/modules/user_profile/model/user_model.dart';
import 'package:manpower_station/app/services/api_client.dart';
import 'package:manpower_station/utils/constants.dart';

class UserController extends BaseController {
  final profilePic = Rx<File?>(null);
  late Rx<UserModel> userData=UserModel().obs;
  RxBool isLoading=true.obs;
  TextEditingController updateNameController=TextEditingController();
  late TextEditingController updateEmailController;
  TextEditingController updateAddressController=TextEditingController();
  TextEditingController updateAreaController=TextEditingController();
  TextEditingController updatePostCodeController=TextEditingController();




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
          "http://172.16.154.43/api/clients/get/unique/client/profile/${Constants.userId}";
      await BaseClient.safeApiCall(
        url,
        RequestType.get,
        onSuccess: (response) {
          if (response.statusCode == 201) {
            final responseData=response.data['client'];
            userData.value= UserModel.fromJson(responseData);
            // Get.snackbar('Success', '${response.data['message']}');
          } else {
            Get.snackbar('Error', 'Having problem to get user data!');
          }
        },
      );
      /// for pre-fill to update email initializing controller;
      updateEmailController=TextEditingController(text: userData.value.phoneOrEmail);
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
          "http://172.16.154.43/api/clients/update/client/profile/${Constants.userId}";
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
    // getUserInformation();
    Future.delayed(const Duration(seconds:1),(){
      isLoading.value=false;
    });
    super.onInit();
  }



  @override
  void onClose() {
    super.onClose();
  }
}
enum FieldType {
  username,
  email,
  description,
  address,
  area,
  avatar_image
}