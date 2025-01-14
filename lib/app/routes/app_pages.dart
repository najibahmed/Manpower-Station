// ignore_for_file: constant_identifier_names, prefer_const_constructors

import 'package:get/get.dart';
import 'package:manpower_station/app/modules/authentication/views/Sign%20In/signin_screen.dart';
import 'package:manpower_station/app/modules/bookings/binding/bookings_binding.dart';
import 'package:manpower_station/app/modules/bookings/view/bookings_view.dart';
import 'package:manpower_station/app/modules/category/bindings/category_bindings.dart';
import 'package:manpower_station/app/modules/category/views/single_category_services.dart';
import 'package:manpower_station/app/modules/checkOut/bindings/checkout_binding.dart';
import 'package:manpower_station/app/modules/checkOut/views/amar_pay_payment.dart';
import 'package:manpower_station/app/modules/checkOut/views/checkout_screen.dart';
import 'package:manpower_station/app/modules/help_support/binding/help_binding.dart';
import 'package:manpower_station/app/modules/help_support/view/help_view.dart';
import 'package:manpower_station/app/modules/help_support/view/report_page.dart';
import 'package:manpower_station/app/modules/onBoarding/on_boarding_bindings.dart';
import 'package:manpower_station/app/modules/onBoarding/on_boarding_view.dart';
import 'package:manpower_station/app/modules/onBoarding/welcome_screen.dart';
import 'package:manpower_station/app/modules/service/bindings/service_binding.dart';
import 'package:manpower_station/app/modules/service/view/service_booking_screen.dart';
import 'package:manpower_station/app/modules/service/view/service_details.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_bindings/user_binding.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_view/updatePhone_otp_view.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_view/update_phoneOrEmail_view.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_view/update_profile.dart';
import 'package:manpower_station/app/modules/user_profile/user_profile_view/user_profile_screen.dart';
import 'package:manpower_station/app/modules/authentication/views/otp/otp_view.dart';
import 'package:manpower_station/app/modules/dashboard/bindings/dashboard_binding.dart';
import 'package:manpower_station/app/modules/dashboard/view/dashboard_view.dart';
import 'package:manpower_station/app/modules/help_support/view/faq_view.dart';
import 'package:manpower_station/app/modules/menu/bindings/menu_bindings.dart';
import 'package:manpower_station/app/modules/menu/views/menu_view.dart';
import 'package:manpower_station/app/modules/worker/bindings/worker_binding.dart';
import 'package:manpower_station/app/modules/worker/view/worker_details.dart';
import 'package:manpower_station/app/modules/worker/view/worker_list_screen.dart';
import 'package:manpower_station/redirect_screen.dart';
import '../modules/authentication/Auth Bindings/authentication_binding.dart';
import '../modules/authentication/views/registration/registration_view.dart';
import '../modules/bookings/view/booking_history_details.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const Home = Routes.homeScreen;
  static const Registration = Routes.registrationScreen;
  static const SignIn = Routes.signInScreen;
  static const OtpScreen = Routes.otpScreen;
  static const UserProfile = Routes.userProfile;
  static const OrderHistory = Routes.orderHistory;
  static const MenusPage = Routes.menusPage;
  static const INITIAL = Routes.redirectScreen;
  static const FaqScreen = Routes.faqScreen;
  static const ServiceBooking = Routes.serviceBooking;
  static const ServiceDetails = Routes.serviceDetailsScreen;
  static const DashboardView = Routes.dashBoard;
  static const CheckoutScreen = Routes.checkOutScreen;
  static const PaymentScreen = Routes.paymentPage;
  static const SingleCateServicesScreen = Routes.singleCatServices;
  static const UpdateProfile = Routes.updateProfile;
  static const WorkerListView = Routes.workerList;
  static const WorkerDetails = Routes.workerDetails;
  static const SupportScreen = Routes.supportScreen;
  static const UpdateEmailPhone = Routes.updateEmailPhone;
  static const UpdateOtp = Routes.updateOtp;
  static const OrderHistoryDetails = Routes.bookingHistoryDetails;
  static const ReportScreen = Routes.reportPage;
  static const OnBoardingView = Routes.onBoarding;
  static const WelcomeView = Routes.welcomePage;

  static final routes = [
    GetPage(
      name: _Paths.OnBoarding,
      page: () => const OnBoardingScreen(),
      binding: OnBoardingBindings(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.Registration,
      page: () => RegistrationView(),
      binding: AuthenticationBinding(),
      // transition: Transition.rightToLeft
    ),
    GetPage(
      name: _Paths.SignIn,
      page: () => SignInScreen(),
      binding: AuthenticationBinding(),
      // transition: Transition.rightToLeft
    ),
    GetPage(
        name: _Paths.OtpScreen,
        page: () => OtpView(),
        binding: AuthenticationBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _Paths.WelcomePage,
        page: () => WelcomeScreen(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _Paths.UserProfile,
        page: () => UserProfileScreen(),
        binding: UserBinding(),
        transition: Transition.native),
    GetPage(
        name: _Paths.BookingHistory,
        page: () => const BookingHistoryView(),
        binding: BookingsBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _Paths.DashBoard,
        page: () => const DashboardScreen(),
        binding: DashboardBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _Paths.MenusPage,
        page: () => const MenuView(),
        binding: MenuBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: _Paths.FaqScreen,
        page: () => FaqView(),
        binding: HelpBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.ReportPage,
        page: () => ReportPage(),
        binding: HelpBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.ServiceBooking,
        page: () => ServiceBookingScreen(),
        binding: ServiceBinding(),
        transition: Transition.rightToLeft),
    GetPage(
      name: _Paths.BookingHistoryDetails,
      page: () => const BookingHistoryDetails(),
      binding: BookingsBinding(),
    ),
    GetPage(
        name: _Paths.ServiceDetailsScreen,
        page: () => const ServiceDetailsScreen(),
        binding: ServiceBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: _Paths.RedirectScreen,
      page: () => const RedirectScreen(),
      // binding: ServiceBinding(),
      // transition: Transition.rightToLeft
    ),
    GetPage(
        name: _Paths.CheckOutScreen,
        page: () => CheckOutScreen(),
        binding: CheckoutBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.PaymentPage,
        page: () => MyPay(),
        binding: CheckoutBinding(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.SingleCatServices,
        page: () => const SingleCategoryServices(),
        binding: CategoryBindings(),
        transition: Transition.fadeIn),
    GetPage(
        name: _Paths.UpdateProfile,
        page: () => UpdateProfileScreen(),
        binding: UserBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: _Paths.WorkerList,
      page: () => WorkerListScreen(),
      binding: WorkerBinding(),
      // transition: Transition.rightToLeftWithFade
    ),
    GetPage(
        name: _Paths.WorkerDetails,
        page: () => const WorkerDetailsScreen(),
        binding: WorkerBinding(),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: _Paths.SupportView,
        page: () => const HelpView(),
        binding: HelpBinding(),
        transition: Transition.fadeIn),
    GetPage(
      name: _Paths.UpdateEmailPhone,
      page: () => UpdatePhoneEmail(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.UpdateOtp,
      page: () => UpdatePhoneOtpView(),
      binding: UserBinding(),
    ),
  ];
}
