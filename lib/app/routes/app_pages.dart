import 'package:get/get.dart';
import 'package:manpower_station/app/modules/authentication/create_profile.dart';
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
import 'package:manpower_station/app/modules/service_list/bindings/service_binding.dart';
import 'package:manpower_station/app/modules/service_list/view/service_details.dart';
import 'package:manpower_station/app/modules/service_list/view/service_list_grid.dart';
import '../modules/authentication/Auth Bindings/authentication_binding.dart';
import '../modules/authentication/views/registration/registration_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const Home = Routes.HOME;
  static const Registration = Routes.Registration;
  static const OtpScreen = Routes.OtpScreen;
  static const RegistrationDone = Routes.VerificationDone;
  static const CreateProfile = Routes.CreateProfile;
  static const OrderHistory = Routes.OrderHistory;
  static const MenusPage = Routes.MenusPage;
  static const INITIAL = Routes.DashBoard;
  static const FaqScreen = Routes.FaqScreen;
  static const ServiceList = Routes.ServiceList;
  static const ServiceDetails = Routes.ServiceDetailsScreen;

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
      transition: Transition.rightToLeft
    ),
    GetPage(
      name: _Paths.OtpScreen,
      page: () =>  OtpView(),
      binding: AuthenticationBinding(),
        transition: Transition.rightToLeft
    ),
    GetPage(
      name: _Paths.VerificationDone,
      page: () =>  VerificationCompleted(),
        transition: Transition.rightToLeft
    ),GetPage(
      name: _Paths.CreateProfile,
      page: () =>  CreateProfileScreen(),
      transition: Transition.rightToLeft
    ),GetPage(
      name: _Paths.OrderHistory,
      page: () =>  OrderHistoryView(),
        binding: OrderBinding(),
      transition: Transition.rightToLeft
    ),GetPage(
      name: _Paths.DashBoard,
      page: () =>  DashboardView(),
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
      name: _Paths.ServiceList,
      page: () =>   ServiceListView(),
        binding: ServiceBinding(),
      transition: Transition.rightToLeft
    ),GetPage(
      name: _Paths.ServiceDetailsScreen,
      page: () => ServiceDetailsScreen(),
        binding: ServiceBinding(),
      // transition: Transition.rightToLeft
    ),
  ];
}
