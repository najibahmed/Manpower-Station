import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:manpower_station/app/data/local/my_shared_pref.dart';

import 'app/core/binding/initial_binding.dart';
import 'app/routes/app_pages.dart';
import 'config/theme/my_theme.dart';
import 'config/translations/localization_service.dart';
import 'utils/awesome_notifications_helper.dart';

Future<void> main() async {
  // wait for bindings
  WidgetsFlutterBinding.ensureInitialized();


  // TODO: implement the FcmHelper class
  // inti fcm services
  // await FcmHelper.initFcm();
  await MySharedPref.init();
  // initialize local notifications service
  await AwesomeNotificationsHelper.init();

  runApp(
    ScreenUtilInit(
      // todo add your (Xd / Figma) artboard size
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) {
        return GetMaterialApp(
          // todo add your app name
          title: "GetXSkeleton",
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            bool themeIsLight = MySharedPref.getThemeIsLight();
            return Theme(
              data: MyTheme.getThemeData(isLight: themeIsLight),
              child: MediaQuery(
                // prevent font from scaling (some people use big/small device fonts)
                // but we want our app font to still the same and dont get affected
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: widget!,
              ),
            );
          },
          initialRoute:AppPages.INITIAL, // first screen to show when app is running
          getPages: AppPages.routes, // app screens
          initialBinding: InitialBinding(),
          locale: MySharedPref.getCurrentLocal(), // app language
          translations: LocalizationService.getInstance(), // localization services in app (controller app language)
          //TODO: implement fallback locale
          //fallbackLocale: LocalizationService.fallbackLocale, // fallback language if app language is not found
        );
      },
    ),
  );
}
