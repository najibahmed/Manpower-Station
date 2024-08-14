
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/core/base/base_view.dart';
import 'package:manpower_station/app/modules/authentication/Auth%20controller/authentication_controller.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';
import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';

class CreateProfileScreen extends BaseView<AuthenticationController>{
  TextStyle myTextStyle = TextStyle(color: LightThemeColors.primaryColor,fontSize: MyFonts.appBarTittleSize);
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    // TODO: implement appBar
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Get.isDarkMode
          ?  DarkThemeColors.backgroundColor:Colors.white,
      centerTitle: true,
      title: Text("${Strings.createProfile.tr}",
        style: myTextStyle.copyWith(color:LightThemeColors.primaryColor,
            fontWeight: FontWeight.bold
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Icon(Icons.check_rounded,size: 28,color: LightThemeColors.primaryColor,),
        )
      ],
    );
  }

  @override
  Widget body(BuildContext context) {
    final size=MediaQuery.of(context).size;
    // TODO: implement body
    return Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 22, right: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.04,
          ),
          Center(
            child: Text( "${Strings.editFindSetting.tr}.",
                style: TextStyle(
                    fontSize: MyFonts.bodyMediumSize,
                    color: LightThemeColors.opacityTextColor,
                    fontWeight: FontWeight.normal)
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Material(
              child: Container(
                height: 110,
                width: 110,
                child: InkWell(
                  onTap: (){
                    controller.pickImage(context);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(.30),
                    radius:100,
                    child: Stack(
                      children: [
                        controller.profilePic.value != null
                            ? Image.file(
                          controller.profilePic.value!,
                          fit: BoxFit.cover,
                        ):
                         Icon(Icons.add_a_photo,color: LightThemeColors.primaryColor,size:60,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.04,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(Icons.person,size: 35,color: LightThemeColors.primaryColor,),
              ),
              Expanded(
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  controller: controller.nameController,
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: LightThemeColors.primaryColor, width: 2.0),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: LightThemeColors.opacityTextColor, width: 2.0),
                      ),
                      hintText: 'Your name',
                      labelStyle: myTextStyle.copyWith(fontWeight: FontWeight.normal,fontSize:MyFonts.bodyMediumSize),
                      labelText: "${Strings.name.tr}",
                      hintStyle: TextStyle(color: LightThemeColors.hintTextColor)),
                  validator: (String? value) {},
                ),
              ),
            ],
          ),
      ],
    ),
    );
  }
  
}