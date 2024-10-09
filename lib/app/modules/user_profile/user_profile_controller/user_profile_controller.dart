
import 'dart:io';
import 'package:dio/dio.dart' as dio;
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
  late TextEditingController oldEmailPhoneController;
  late TextEditingController newEmailPhoneController;
  late TextEditingController updateOtpController;
  late TextEditingController updateNameController;
   late TextEditingController updateDescriptionController;
  late TextEditingController updateAddressController;
  late TextEditingController updateAreaController;
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
      print('Image selected: ${image.path}');
      // Do something with the image file, like uploading or displaying it
    }else{
      profilePic.value = File('');
    }
  }
  /// Get user information
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
      updateDescriptionController=TextEditingController(text: userData.value.profileDescription?? 'null');
      updateNameController=TextEditingController(text: userData.value.username??"null");
      updateAddressController=TextEditingController(text: userData.value.address??"null");
      updateAreaController=TextEditingController(text: userData.value.area??"null");
    } catch (e) {
      Get.snackbar('Error :', e.toString());
    }
  }

  /// update email or phone Number
  Future<void> updatePhoneOrEmail() async {
    try {
      Map<String, dynamic> requestData = {
        'oldPhoneNumber_Or_email': oldEmailPhoneController.text.trim(),
        'newPhoneNumber_Or_email': newEmailPhoneController.text.trim(),
      };
      await BaseClient.safeApiCall(
        "/api/users/update/user/phone_or_email",
        RequestType.put,
        data: requestData,
        onSuccess: (response){
          if(response.statusCode==200){
            print('${response.data['message']}');
            if(response.data['success'] == true){
              Get.toNamed(AppPages.UpdateOtp);
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
    dio.FormData formData = dio.FormData.fromMap({
      'avatar' : '',              // MultipartFile(imageData.path, filename: fileName),
      'username' : updateNameController.text.trim(),
      'profile_description' : updateDescriptionController.text.trim(),
      'address' : updateAddressController.text.trim(),
      'area' : updateAreaController.text.trim(),
    });
    // Map<String, dynamic> requestData = {
    //   'avatar' :  null,
    //   'username' : updateNameController.text.trim(),
    //   'profile_description' : updateDescriptionController.text.trim(),
    //   'address' : updateAddressController.text.trim(),
    //   'area' : updateAreaController.text.trim(),
    // };

    try {
      if(profilePic.value!=null){
       File imageData=profilePic.value!;
        String fileName=imageData.path.split('/').last;
        formData.files.add(MapEntry('avatar',
            await dio.MultipartFile.fromFile(imageData.path, filename: fileName)));
      };
      // if(profilePic.value!=null){
      //   File imageData=profilePic.value!;
      //   String fileName=imageData.path.split('/').last;
      //      requestData = {
      //     'avatar' :   await dio.MultipartFile.fromFile(imageData.path, filename: fileName),
      //     'username' : updateNameController.text.trim(),
      //     'profile_description' : updateDescriptionController.text.trim(),
      //     'address' : updateAddressController.text.trim(),
      //     'area' : updateAreaController.text.trim(),
      //   };
      // }
      String userid = MySharedPref.getUserId().toString();
      String url =
          "/api/clients/update/client/profile/${Constants.userId}";
      await BaseClient.safeApiCall(
        url,
        RequestType.put,
        data: formData  ,
        onSuccess: (response) {
          if (response.statusCode == 200){
            getUserInformation();
            profilePic.value=null;
            Get.back();
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
  Future<void> updateOtpVerification() async {
    try {
      Map<String, dynamic> requestData = {
        'otp': updateOtpController.text.trim(),
      };
      await BaseClient.safeApiCall(
        "/api/users/update/user/phone_email/verified",
        RequestType.put,
        data: requestData,
        onError: (err) {
          var response= err.response;
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
            MySharedPref.setRefreshToken(refToken);
            // Success handling (for example, navigate to another screen)
            Get.snackbar('Successfully Changed', '${otpData.message}');
            Get.offNamed(AppPages.UserProfile);
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
    getUserInformation();
    oldEmailPhoneController=TextEditingController();
    newEmailPhoneController=TextEditingController();
    updateOtpController=TextEditingController();
    updateAddressController=TextEditingController();
    updateNameController=TextEditingController();
    updateDescriptionController=TextEditingController();
    updateAreaController=TextEditingController();
    Future.delayed(const Duration(seconds:3),(){
      isLoading.value=false;
    });
    super.onInit();
  }
  @override
  void onClose() {

    oldEmailPhoneController.dispose();
    newEmailPhoneController.dispose();
    updateOtpController.dispose();
    updateNameController.dispose();
    updateDescriptionController.dispose();
    updateAddressController.dispose();
    updateAreaController.dispose();
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