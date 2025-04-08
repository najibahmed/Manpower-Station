// ignore_for_file: depend_on_referenced_package;


import 'package:intl/intl.dart';
import 'package:manpower_station/app/network/api_list.dart';

class Constants {
  static const String logoAssetPath = 'assets/images/manpower_name_logo.png';
  // static const String baseUrl = 'http://172.16.154.4:8000';
  // static const String avatarImgUrl = 'http://172.16.154.11/images/avatars/';
  // static const String bannerImgUrl = 'http://172.16.154.11/images/banners/';
  // static const String serviceImgUrl = 'http://172.16.154.11/images/services/';
  static const String avatarImgUrl = '${ApiList.baseUrl}/images/avatars/';
  static const String bannerImgUrl = '${ApiList.baseUrl}/images/banners/';
  static const String serviceImgUrl = '${ApiList.baseUrl}/images/services/';
  static const String categoryImgUrl = '${ApiList.baseUrl}/images/services_categories/';
  static const String appSplashUrl = "assets/images/splash_screen.png";
  // static const String banglaCurrency = '৳';
  static const String banglaCurrency = 'Tk ';
  static const String starSymbol = '⭐';
  static const String userId = '66dc0571a521a07c53202ae7';
  static const String accessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2NzAyNWQzYTE0MGRiMzQ0NjVmOTU1MjAiLCJpYXQiOjE3MjgyMDg0NDEsImV4cCI6MTczMDgwMDQ0MX0.BSdm2lQmDKvG1Q5lvNASL0i0E-cEjMBb4IF-C3EMFJU';
  static  DateFormat formatDateTime = DateFormat('dd MMMM yyyy, hh:mm a');
  static  DateFormat formatDate = DateFormat('dd MMMM yyyy');
  static  DateFormat formatTime = DateFormat('hh:mm a');

}


final List <int> timeFrequency = [1,2,3, 4, 5, 6, 7, 8];
