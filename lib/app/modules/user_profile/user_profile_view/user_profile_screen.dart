
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_controller/user_profile_controller.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';

// ignore: must_be_immutable
class UserProfileScreen extends BaseView<UserController> {
  TextStyle myTextStyle = TextStyle(
      color: LightThemeColors.primaryColor, fontSize: MyFonts.appBarTittleSize);

  UserProfileScreen({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(onPressed: (){
        Get.back();
      },
          icon: const Icon(Icons.arrow_back,color: LightThemeColors.primaryColor,)),
      backgroundColor:
          Get.isDarkMode ? DarkThemeColors.backgroundColor : Colors.white,
      centerTitle: true,
      title: Text(
        "User Profile",
        style: myTextStyle.copyWith(
            color: LightThemeColors.primaryColor, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(onPressed: (){
          Get.toNamed(AppPages.UpdateProfile);
        },
            icon: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Icon(Icons.edit,color: Colors.green,),
            ))
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // TODO: implement body
    return controller.isLoading.value? const Center(child: CircularProgressIndicator()):Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.04,
          ),
          SizedBox(
            height: size.height * 0.03,
          ),
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Material(
                  child: SizedBox(
                    height: 110,
                    width: 110,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.30),
                      radius: 100,
                      child: Stack(
                        children: [
                          controller.profilePic.value != null
                              ? Image.file(
                                  controller.profilePic.value!,
                                  fit: BoxFit.cover,
                                )
                              : const Icon(
                                  Icons.person,
                                  color: LightThemeColors.primaryColor,
                                  size: 60,
                                )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.04,
          ),

          CustomListTileEditButton(context:context,title:'Name',onEdit:(value)async{
            // await controller.updateUserProfileField(FieldType.username, value);
            // print('this is value-->$value');
          }, icon: Icons.person, subTitle: 'Update name' ?? 'name'),
          const SizedBox(height: 15,),
          ListTile(
            leading: const Icon(Icons.phone_android),
            title:  Text( controller.userData.value.phoneOrEmail??"Login Email or phone number here."),
            subtitle: const Text(
            "Update your phone or email.",
            style: TextStyle(color: Colors.black54),
          ),
            trailing: IconButton(onPressed: (){
              Get.toNamed(AppPages.UpdateEmailPhone);
            },
                icon: const Icon(Icons.edit)),
          ),
          // CustomListTileEditButton(
          //     context:context,title:'Phone Number',onEdit:(value){
          //   print('this is value-->$value');
          // }, icon: Icons.phone_android_outlined, subTitle:  'Update phone number' ?? 'name'),
          const SizedBox(height: 15,),
          // CustomListTileEditButton(
          //     context:context,
          //     title:  'Email',
          //     onEdit:(value) async {
          //       await controller.updateUserProfileField(FieldType.email, value);
          //   print('this is value-->$value');
          // }, icon: Icons.phone_android_outlined, subTitle:  controller.userData.value.phoneOrEmail??'Update Email Address'),
          const SizedBox(height: 15,),
          CustomListTileEditButton(context:context,icon:Icons.pin_drop,title:'Address', onEdit:(value)async{
            // await controller.updateUserProfileField(FieldType.address, value);
            // print('this is value-->$value');
    }, subTitle:  'Update address' ?? 'name',)
        ],
      ),
    );
  }

  ListTile CustomListTileEditButton(
      {required BuildContext context,required title, required subTitle,required  onEdit, required IconData icon})
  {
    return ListTile(
          leading: Icon(icon),
          title: Text(
            title,
            style: const TextStyle(color: Colors.black54),
          ),
          // subtitle: Text(
          //   subTitle,
          //   style: const TextStyle(color: Colors.black54),
          // ),
          // trailing: IconButton(
          //   onPressed: () {
          //     showSingleTextInputDialog(context: context, title: title, onSubmit:onEdit);
          //   },
          //   icon: const Icon(Icons.edit),
          // ),
        );
  }
}
