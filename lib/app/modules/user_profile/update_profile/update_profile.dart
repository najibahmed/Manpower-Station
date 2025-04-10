import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_controller/user_profile_controller.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';

import 'package:manpower_station/utils/helper_function.dart';

import '../../../components/custom_loading_overlay.dart';
import '../../../components/custom_snackbar.dart';

// ignore: must_be_immutable
class UpdateProfileScreen extends BaseView<UserController> {
  TextStyle myTextStyle = TextStyle(
      color: LightThemeColors.primaryColor, fontSize: MyFonts.appBarTittleSize);

  UpdateProfileScreen({super.key});
  @override
  PreferredSizeWidget? appBar(BuildContext context) {

    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              LightThemeColors.primaryColor,LightThemeColors.secondaryColor], // Gradient colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                controller.profilePic.value=null;
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          // backgroundColor:
          //     Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
          centerTitle: true,
          title: Text(
            "Edit Profile",
            style: myTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            TextButton(
              onPressed: () async{
                if(await HelperFunction.instance.isInternetConnected()){
                  _updateUser();
                } else {
                  CustomSnackBar.showCustomErrorToast(
                      title: "No Internet!!", message: "Please check internet connection.");
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Save",
                  style:  TextStyle(color: Colors.green),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement body
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.04,
                ),
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Material(
                        child: SizedBox(
                          height: 110,
                          width: 110,
                          child: InkWell(
                            onTap: () {
                              controller.pickImage(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(.30),
                              ),
                              child: controller.profilePic.value!= null
                                  ?
                              Image.file(
                                controller.profilePic.value!,
                                fit: BoxFit.cover,
                              ):
                              controller.userData?.value.avatar!=null ?
                              HelperFunction.instance.isSvgOrJpg("${controller.userData?.value.avatar}", context)
                                  : const Icon(
                                      Icons.add_a_photo,
                                      color: LightThemeColors.primaryColor,
                                      size: 60,
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: InkWell(
                        onTap: () {
                          controller.pickImage(context);
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(.45),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.65))),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.camera_alt,
                                size: 20,
                                color: Colors.black.withOpacity(.75),
                              ),
                            )),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Icon(
                        Icons.person,
                        size: 25,
                        color: LightThemeColors.primaryColor,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(fontWeight: FontWeight.normal),
                        keyboardType: TextInputType.name,
                        controller: controller.updateNameController,
                        decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: LightThemeColors.primaryColor,
                                  width: 2.0),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: LightThemeColors.opacityTextColor,
                                  width: 2.0),
                            ),
                            labelStyle: myTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: MyFonts.bodyMediumSize),
                            labelText: Strings.name.tr,
                            hintStyle: const TextStyle(
                                color: LightThemeColors.hintTextColor)),
                        // validator: (String? value) {
                        //   if(value!.isEmpty){
                        //     return 'Please Enter a name';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Icon(
                        Icons.mail,
                        size: 25,
                        color: LightThemeColors.primaryColor,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        maxLines: 2,
                        style: const TextStyle(fontWeight: FontWeight.normal),
                        keyboardType: TextInputType.text,
                        controller: controller.updateDescriptionController,
                        decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: LightThemeColors.primaryColor,
                                  width: 2.0),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: LightThemeColors.opacityTextColor,
                                  width: 2.0),
                            ),
                            labelStyle: myTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: MyFonts.bodyMediumSize),
                            labelText: "Description",
                            hintStyle: const TextStyle(
                                color: LightThemeColors.hintTextColor)),
                        // validator: (String? value) {
                        //   if(value!.isEmpty){
                        //     return 'Please Enter your Description.';
                        //   }
                        //   return null;
                        // },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Icon(
                        Icons.home,
                        size: 25,
                        color: LightThemeColors.primaryColor,
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        style: const TextStyle(fontWeight: FontWeight.normal),
                        keyboardType: TextInputType.streetAddress,
                        controller: controller.updateAddressController,
                        decoration: InputDecoration(
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: LightThemeColors.primaryColor,
                                  width: 2.0),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: LightThemeColors.opacityTextColor,
                                  width: 2.0),
                            ),
                            labelStyle: myTextStyle.copyWith(
                                fontWeight: FontWeight.normal,
                                fontSize: MyFonts.bodyMediumSize),
                            labelText: "Address",
                            hintStyle: const TextStyle(
                                color: LightThemeColors.hintTextColor)),
                        // validator: (String? value) {
                        //   if(value!.isEmpty){
                        //   return 'Please Enter your Address';
                        // }
                        // return null;},
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Icon(
                          Icons.signpost,
                          size: 25,
                          color: LightThemeColors.primaryColor,
                        ),
                      ),
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(fontWeight: FontWeight.normal),
                          keyboardType: TextInputType.streetAddress,
                          controller: controller.updateAreaController,
                          decoration: InputDecoration(
                              focusedBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: LightThemeColors.primaryColor,
                                    width: 2.0),
                              ),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: LightThemeColors.opacityTextColor,
                                    width: 2.0),
                              ),
                              labelStyle: myTextStyle.copyWith(
                                  fontWeight: FontWeight.normal,
                                  fontSize: MyFonts.bodyMediumSize),
                              labelText: "Area",
                              hintStyle: const TextStyle(
                                  color: LightThemeColors.hintTextColor)),
                          // validator: (String? value) {
                          //   if(value!.isEmpty){
                          //     return 'Please Enter your Area.';
                          //   }
                          //   return null;
                          // },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateUser() async {
    if (_formKey.currentState!.validate()) {
      try {
       // await controller.updateUserProfileField();
        showLoadingOverLay(
            asyncFunction: controller.updateUserProfileField(),
            msg: "Updating");

      } catch (error) {
        //   controller.errMsg.value = error.message;
        CustomSnackBar.showFlutterToast(message: error.toString());
      }
    }
  }
}
