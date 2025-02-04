import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:manpower_station/utils/notification_helper.dart';
import 'app/core/binding/initial_binding.dart';
import 'app/data/local/my_shared_pref.dart';
import 'app/routes/app_pages.dart';
import 'config/theme/my_theme.dart';
import 'config/translations/localization_service.dart';
import 'firebase_options.dart';



Future<void> main() async {
  // wait for bindings
  WidgetsFlutterBinding.ensureInitialized();
  await MySharedPref.init();
  final onboardingComplete = await MySharedPref.getOnBoardingStatus();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // initialize local notifications service
  await NotificationService.instance.initialize();

  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) {
        return GetMaterialApp(
          title: "ManPowerStation",
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          builder: (context, widget) {
            bool themeIsLight = MySharedPref.getThemeIsLight();
            return  Theme(
              data: MyTheme.getThemeData(isLight: themeIsLight),
              child: MediaQuery(
                // prevent font from scaling (some people use big/small device fonts)
                // but we want our app font to still the same and don't get affected
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: widget!,
              ),
            );
          },
          initialRoute: onboardingComplete? AppPages.INITIAL: AppPages.OnBoardingView , // first screen to show when app is running
          getPages: AppPages.routes, // app screens
          initialBinding: InitialBinding(),
          locale: MySharedPref.getCurrentLocal(), // app language
          translations: LocalizationService.getInstance(), // localization services in app (controller app language)
          //fallbackLocale: LocalizationService.fallbackLocale, // fallback language if app language is not found
        );
      },
    ),
  );
}
