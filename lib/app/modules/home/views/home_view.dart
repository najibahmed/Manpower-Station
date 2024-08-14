import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:manpower_station/app/components/custom_button.dart';
import 'package:manpower_station/app/modules/home/views/service_option.dart';
import 'package:manpower_station/app/modules/order_history/view/order_history_view.dart';
import 'package:manpower_station/app/routes/app_pages.dart';
import 'package:manpower_station/config/theme/dark_theme_colors.dart';

import 'package:manpower_station/config/theme/light_theme_colors.dart';
import 'package:manpower_station/config/theme/my_fonts.dart';
import 'package:manpower_station/config/translations/strings_enum.dart';
import '../../../../config/theme/my_theme.dart';
import '../../../../config/translations/localization_service.dart';
import '../../../core/base/base_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  const HomeView({super.key});

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
        centerTitle: true,
        leading: InkWell(
          onTap: () => LocalizationService.updateLanguage(
            LocalizationService.getCurrentLocal().languageCode == 'bn'
                ? 'en'
                : 'bn',
          ),
          child: SizedBox(
            height: 30.h,
            width: 30.h,
            // decoration: theme.extension<HeaderContainerThemeData>()?.decoration,
            child: SvgPicture.asset(
              'assets/vectors/language.svg',color: LightThemeColors.primaryColor ,
              fit: BoxFit.none,
              height: 10,
              width: 10,
            ),
          ),
        ),
        backgroundColor: Get.isDarkMode
            ?  DarkThemeColors.backgroundColor:Colors.white,
        title: Image.asset(
          'assets/images/manpower_name_logo.png',
          fit: BoxFit.cover,
        ),
        actions: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(onPressed: (){}, 
                  icon: Icon(Icons.notifications_active_outlined,color: LightThemeColors.primaryColor,)),
              InkWell(
                onTap: () => MyTheme.changeTheme(),
                child: Container(
                  height: 39.h,
                  width: 39.h,
                  // decoration:
                      // theme.extension<HeaderContainerThemeData>()?.decoration,
                  child: SvgPicture.asset(
                    Get.isDarkMode
                        ? 'assets/vectors/sun.svg'
                        : 'assets/vectors/moon.svg',
                    fit: BoxFit.none,
                    color: Get.isDarkMode
                        ? LightThemeColors.backgroundColor: DarkThemeColors.backgroundColor ,
                    height: 10,
                    width: 10,
                  ),
                ),
              ),
            ],
          ),
        ]);
  }

  @override
  Widget body(BuildContext context) {
    final List<String> imageUrls = [
      'assets/images/carosal_img.jpg',
      'assets/images/carosal_img.jpg',
      'assets/images/carosal_img.jpg',
      'assets/images/carosal_img.jpg',
      'assets/images/carosal_img.jpg',
      'assets/images/carosal_img.jpg',
    ];
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.30),
                      radius:100,
                      child: Icon(Icons.person,color: LightThemeColors.primaryColor,size:40,),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi! ${Strings.name.tr}.',
                        style: TextStyle(fontSize: MyFonts.bodyMediumSize, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2),
                      Text('${Strings.help.tr}',
                        style: TextStyle(fontSize: MyFonts.bodySmallTextSize, fontWeight: FontWeight.bold),),
                      Text('${Strings.chooseService.tr}',
                        style: TextStyle(fontSize: MyFonts.bodySmallTextSize, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    // enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    pauseAutoPlayOnTouch: true,
                    viewportFraction: 1.0,
                  ),
                  items: imageUrls.map((url) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                          ),
                          child: Image.asset(
                            url,
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20),
              Text(
                '${Strings.askTypeOfService.tr}?',
                style: TextStyle(fontSize: MyFonts.bodyMediumSize, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ServiceOption(
                    label: '${Strings.maid.tr}',
                    image: 'assets/images/maid_icon.png',
                    onTap: () {  },
                  ),
                  ServiceOption(
                    label: '${Strings.careGiver.tr}',
                    image: 'assets/images/caregiver_icon.png',
                    onTap: () {  },
                  ),
                  ServiceOption(
                    label: '${Strings.babySitter.tr}',
                    image: 'assets/images/babysitter_icon.png',
                    onTap: () {  },
                  ),
                  ServiceOption(
                    label: '${Strings.more.tr}',
                    image: 'assets/images/more_icon.png',
                    onTap: () {  },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    // Icon(Icons.assignment_turned_in, color: Colors.green, size: 40),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order ID: #123456',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Maid Service. \nStarting Date: 30 July 2024',
                            style:
                                TextStyle(fontSize: MyFonts.bodySmallTextSize),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          CustomButton(
                              title: 'View Order',
                              height: 40,
                              width: 150,
                              onTap: () {})
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/active_order.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
        Column(
            children: [
                TextButton(onPressed: (){
                  print('tap');
                  Get.toNamed(AppPages.Registration,);
                },
                    child: Text("registration page")),

            ],
          ),
            ],
          ),
        ),
      ),
    );
  }
}
