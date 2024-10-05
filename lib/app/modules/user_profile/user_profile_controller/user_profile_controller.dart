
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manpower_station/app/core/base/base_controller.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';
import 'package:manpower_station/app/modules/authentication/views/otp/otp_model.dart';
import 'package:manpower_station/app/modules/user_profile/model/user_model.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/app/services/api_client.dart';
import 'package:manpower_station/utils/constants.dart';

class UserController extends BaseController {
  final profilePic = Rx<File?>(null);
  RxString errorMessage=''.obs;
  late Rx<UserModel> userData=UserModel().obs;
  RxBool isLoading=true.obs;
  TextEditingController oldEmailPhoneController=TextEditingController();
  TextEditingController newEmailPhoneController=TextEditingController();
  TextEditingController updateOtpController=TextEditingController();
  TextEditingController updateNameController=TextEditingController();
   TextEditingController updateDescriptionController=TextEditingController();
  TextEditingController updateAddressController=TextEditingController();
  TextEditingController updateAreaController=TextEditingController();
  // TextEditingController updatePostCodeController=TextEditingController();




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
          "/api/clients/get/unique/client/profile/${Constants.userId}";
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
      updateDescriptionController=TextEditingController(text: userData.value.phoneOrEmail);
    } catch (e) {
      Get.snackbar('Error :', e.toString());
    }
  }


  /// update email or phone Number
  Future<void> updatePhoneOrEmail() async {
    var userId=await MySharedPref.getUserId();
    try {
      Map<String, dynamic> requestData = {
        'phone_or_email': oldEmailPhoneController.text.trim(),
      };
      await BaseClient.safeApiCall(
        "/api/users/update/user/phone_or_email/${Constants.userId}",
        RequestType.put,
        data: requestData,
        onSuccess: (response){
          if(response.statusCode==201){
            print('${response.data['message']}');
            if(response.data['success'] == true){
              // Get.toNamed(AppPages.UpdateOtp);
            }else{
              Get.snackbar('Error','Having problem to send otp');
            }
          }
        },
      );
    } catch (e) {
      Get.snackbar('Error :',e.toString());
    }
  }

/// Update user profile field
  Future<void> updateUserProfileField() async {
    Map<String, dynamic> requestData = {
      'avatar' : profilePic.value,
      'username' : updateNameController.text.trim(),
      'description' : updateDescriptionController.text.trim(),
      'address' : updateAddressController.text.trim(),
      'area' : updateAreaController.text.trim(),
    };
    try {
      String userid = MySharedPref.getUserId().toString();
      String url =
          "/api/clients/update/client/profile/${Constants.userId}";
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


  /// Update Email Otp verification
  Future<void> otpVerification(String pin) async {
    try {
      Map<String, dynamic> requestData = {
        'otp': pin,
      };
      await BaseClient.safeApiCall(
        "/api/users/update/user/phone_email/verified",
        RequestType.put,
        data: requestData,
        onError: (p0) {
          var response= p0.response;
          updateOtpController.clear();
          Get.snackbar('Wrong otp',"${response!.data['message']}");
        },
        onSuccess: (response) {
          if (response.statusCode == 200) {
            Map<String,dynamic> responseData = response.data;
            OtpModel otpData= OtpModel.fromJson(responseData);

            print("------->$otpData");

            String accToken=otpData.token!.accesstoken!;
            String refToken=otpData.token!.refreshtoken!;
            MySharedPref.setAccessToken(accToken);
            MySharedPref.setAccessToken(refToken);
            // Success handling (for example, navigate to another screen)
            Get.snackbar('Success', '${otpData.message}');
            Get.offAllNamed(AppPages.UserProfile);
          }else{
            // Handle error
            errorMessage.value = 'Error: ${response.data['message']}';
            Get.snackbar('Error', errorMessage.value);
          }
        },
      );
    } catch (e) {
      // Handle other types of errors
      errorMessage.value = 'Something went wrong: $e';
      Get.snackbar('Error', errorMessage.value);
    } finally {
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
    // updateEmailPhoneController.dispose();
    // updateOtpController.dispose();
    // updateNameController.dispose();
    // updateDescriptionController.dispose();
    // updateAddressController.dispose();
    // updateAreaController.dispose();
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