import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manpower_station/app/modules/authentication/views/otp/otp_model.dart';
import 'package:manpower_station/app/services/api_client.dart';
import '../../../core/base/base_controller.dart';

class AuthenticationController extends BaseController {
  TextEditingController phoneNumberEmailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  RxBool showError = false.obs;
  final profilePic = Rx<File?>(null);
  final RxString errorMessage = ''.obs;
  final RxBool isLoading = false.obs;

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
                leading: Icon(Icons.camera),
                title: Text('Take a Photo'),
                onTap: () async {
                  Navigator.of(context)
                      .pop(await picker.pickImage(source: ImageSource.camera));
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Choose from Gallery'),
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

  Future<void> loginWithPhoneOrEmail() async {
    try {
      Map<String, dynamic> requestData = {
        'phone_or_email': phoneNumberEmailController.text.trim(),
      };
      await BaseClient.safeApiCall(
        "http://172.16.154.43/api/users/sign_in/sign_up",
        RequestType.post,
        data: requestData,
        onSuccess: (response){
          if(response.statusCode==201){
            if (kDebugMode) {
              print('Success data here------${response.data['success']}');
              print('Message data here------${response.data['message']}');
            }
            var jsonData=response.statusMessage;
            Get.snackbar('Success',jsonData!);
          }
        },
      );
    } catch (e) {
      Get.snackbar('Error :',e.toString());
    }
  }

  Future<void> otpVerification() async {
    try {
      Map<String, dynamic> requestData = {
        'otp_code': otpController.text.trim(),
      };
      await BaseClient.safeApiCall(
        "http://172.16.154.43/api/users/signup/phone_email/verified",
        RequestType.put,
        data: {"otp": requestData},
        onSuccess: (response) {
          if (response.statusCode == 200) {
            Map<String,dynamic> responseData = response.data;
            OtpModel otpData= OtpModel.fromJson(responseData);
            // Success handling (for example, navigate to another screen)
            Get.snackbar('Success', '${otpData.message}');
          } else {
            // Handle error
            errorMessage.value = 'Error: ${response.data['message']}';
            Get.snackbar('Error', errorMessage.value);
          }
          if (kDebugMode) {
            print(response.statusCode);
          }


        },
      );
    } catch (e) {
      // Handle other types of errors
      errorMessage.value = 'Something went wrong';
      Get.snackbar('Error', errorMessage.value);
    } finally {
      isLoading(false);
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
    phoneNumberEmailController;
    nameController;
    otpController;
    super.onClose();
  }
}
