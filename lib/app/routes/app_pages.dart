// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:manpower_station/app/modules/checkOut/bindings/checkout_binding.dart';
import 'package:manpower_station/app/modules/checkOut/views/checkout_screen.dart';
import 'package:manpower_station/app/modules/service/bindings/service_binding.dart';
import 'package:manpower_station/app/modules/service/view/service_booking_screen.dart';
import 'package:manpower_station/app/modules/service/view/service_details.dart';
import 'package:manpower_station/app/modules/user_profile/user_bindings/user_binding.dart';
import 'package:manpower_station/app/modules/user_profile/user_view/user_profile_screen.dart';
import 'package:manpower_station/app/modules/authentication/verification_done.dart';
import 'package:manpower_station/app/modules/authentication/views/otp/otp_view.dart';
import 'package:manpower_station/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:manpower_station/app/modules/dashboard/view/dashboard_view.dart';
import 'package:manpower_station/app/modules/faq/bindings/faq_bindings.dart';
import 'package:manpower_station/app/modules/faq/view/faq_view.dart';
import 'package:manpower_station/app/modules/menu/bindings/menu_bindings.dart';
import 'package:manpower_station/app/modules/menu/views/menu_view.dart';
import 'package:manpower_station/app/modules/order_history/binding/order_binding.dart';
import 'package:manpower_station/app/modules/order_history/view/order_history_view.dart';
import 'package:manpower_station/redirect_screen.dart';
import '../modules/authentication/Auth Bindings/authentication_binding.dart';
import '../modules/authentication/views/registration/registration_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const Home = Routes.homeScreen;
  static const Registration = Routes.registrationScreen;
  static const OtpScreen = Routes.otpScreen;
  static const RegistrationDone = Routes.verificationDone;
  static const CreateProfile = Routes.createProfile;
  static const OrderHistory = Routes.orderHistory;
  static const MenusPage = Routes.menusPage;
  static const INITIAL = Routes.redirectScreen;
  static const FaqScreen = Routes.faqScreen;
  static const ServiceBooking = Routes.serviceBooking;
  static const ServiceDetails = Routes.serviceDetailsScreen;
  static const DashboardView = Routes.dashBoard;
  static const CheckoutScreen = Routes.checkOutScreen;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.Registration,
      page: () =>  RegistrationView(),
      binding: AuthenticationBinding(),
      // transition: Transition.rightToLeft
    ),
    GetPage(
      name: _Paths.OtpScreen,
      page: () =>  const OtpView(),
      binding: AuthenticationBinding(),
        transition: Transition.rightToLeft
    ),
    GetPage(
      name: _Paths.VerificationDone,
      page: () =>  VerificationCompleted(),
        transition: Transition.rightToLeft
    ),GetPage(
      name: _Paths.CreateProfile,
      page: () =>  UserProfileScreen(),
      binding: UserBinding(),
      transition: Transition.rightToLeft
    ),GetPage(
      name: _Paths.OrderHistory,
      page: () => const OrderHistoryView(),
        binding: OrderBinding(),
      transition: Transition.rightToLeft
    ),GetPage(
      name: _Paths.DashBoard,
      page: () =>  DashboardScreen(),
        binding: DashboardBinding(),
      transition: Transition.rightToLeft
    ),GetPage(
      name: _Paths.MenusPage,
      page: () =>  const MenuView(),
        binding: MenuBinding(),
      transition: Transition.rightToLeft
    ),GetPage(
      name: _Paths.FaqScreen,
      page: () =>   FaqView(),
        binding: FaqBindings(),
      transition: Transition.rightToLeft
    ),GetPage(
      name: _Paths.ServiceBooking,
      page: () =>   ServiceBookingScreen(),
        binding: ServiceBinding(),
      transition: Transition.rightToLeft
    ),GetPage(
      name: _Paths.ServiceDetailsScreen,
      page: () => const ServiceDetailsScreen(),
        binding: ServiceBinding(),
      // transition: Transition.rightToLeft
    ),GetPage(
      name: _Paths.RedirectScreen,
      page: () => const RedirectScreen(),
        // binding: ServiceBinding(),
      // transition: Transition.rightToLeft
    ),GetPage(
      name: _Paths.CheckOutScreen,
      page: () =>  CheckOutScreen(),
        binding: CheckoutBinding(),
      transition: Transition.rightToLeft
    ),
  ];
}
