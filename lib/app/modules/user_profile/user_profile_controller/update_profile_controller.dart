//
// import 'dart:io';
// import 'package:dio/dio.dart' as dio;
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:manpower_station/app/core/base/base_controller.dart';
// import 'package:manpower_station/app/data/local/my_shared_pref.dart';
// import 'package:manpower_station/app/modules/user_profile/model/user_model.dart';
// import 'package:manpower_station/app/modules/user_profile/user_profile_controller/user_profile_controller.dart';
// import 'package:manpower_station/app/modules/user_profile/user_repo/user_repository.dart';
// import '../../../components/custom_snackbar.dart';
// import '../../../network/api_client.dart';
// import '../../../network/api_list.dart';
//
// class UpdateProfileController extends BaseController {
//   final UserRepository userRepository;
//   UpdateProfileController({required this.userRepository});
//
//   final profilePic = Rx<File?>(null);
//   RxString errorMessage=''.obs;
//   late Rx<UserModel>? userData=UserModel().obs;
//
//   late TextEditingController updateOtpController;
//   late TextEditingController updateNameController;
//   late TextEditingController updateDescriptionController;
//   late TextEditingController updateAddressController;
//   late TextEditingController updateAreaController;
//
//
//
//   /// pick user profile image
//   Future<void> pickImage(BuildContext context) async {
//     final ImagePicker picker = ImagePicker();
//
//     // Show a bottom sheet with options to choose between camera and gallery
//     final XFile? image = await showModalBottomSheet<XFile>(
//       context: context,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ListTile(
//                 leading: const Icon(Icons.camera),
//                 title: const Text('Take a Photo'),
//                 onTap: () async {
//                   Navigator.of(context)
//                       .pop(await picker.pickImage(source: ImageSource.camera));
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.image),
//                 title: const Text('Choose from Gallery'),
//                 onTap: () async {
//                   Navigator.of(context)
//                       .pop(await picker.pickImage(source: ImageSource.gallery));
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//
//     if (image != null) {
//       // Handle the picked image file (e.g. display it in an Image widget)
//       profilePic.value = File(image.path);
//       // Do something with the image file, like uploading or displaying it
//     }else{
//       // profilePic.value = File('');
//     }
//   }
//
//
//
//
//   /// Update user profile field
//   Future<void> updateUserProfileField() async {
//     dio.FormData formData = dio.FormData.fromMap({
//       'avatar' : '',              // MultipartFile(imageData.path, filename: fileName),
//       'username' : updateNameController.text.trim(),
//       'profile_description' : updateDescriptionController.text.trim(),
//       'address' : updateAddressController.text.trim(),
//       'area' : updateAreaController.text.trim(),
//     });
//
//     try {
//       if(profilePic.value!=null){
//         File imageData=profilePic.value!;
//         String fileName=imageData.path.split('/').last;
//         formData.files.add(MapEntry('avatar',
//             await dio.MultipartFile.fromFile(imageData.path, filename: fileName)));
//       };
//       String? userId = await MySharedPref.getUserId();
//       String url = ApiList.updateProfileInfoUrl(userId!);
//       await BaseClient.safeApiCall(
//         url,
//         RequestType.put,
//         // headers: {
//         //   'Authorization': Constants.accessToken
//         // },
//         data: formData  ,
//         onSuccess: (response) {
//           if (response.statusCode == 200){
//             Get.find<UserController>().getUserInformation();
//             profilePic.value=null;
//             Get.back();
//             CustomSnackBar.showCustomSnackBar(title:'Success',message: '${response.data['message']}',
//                 duration: const Duration(seconds: 1));
//           } else {
//             CustomSnackBar.showCustomErrorSnackBar(title:'Error',message: 'Having problem to update user data!',
//                 duration: const Duration(seconds: 1));
//           }
//         },
//       );
//     } catch (e) {
//       CustomSnackBar.showCustomErrorSnackBar(title:'Error try update user :',message: '$e',
//           duration: const Duration(seconds: 1));
//     }
//   }
//
//
//
//
//   @override
//   void onInit() {
//     updateOtpController=TextEditingController();
//     updateAddressController=TextEditingController();
//     updateNameController=TextEditingController();
//     updateDescriptionController=TextEditingController();
//     updateAreaController=TextEditingController();
//     super.onInit();
//   }
//   @override
//   void onClose() {
//
//     updateOtpController.dispose();
//     updateNameController.dispose();
//     updateDescriptionController.dispose();
//     updateAddressController.dispose();
//     updateAreaController.dispose();
//     super.onClose();
//   }
// }
