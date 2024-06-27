import 'package:get/get.dart';
import 'package:gotdirt/app/backend/binding/accessibility_binding.dart';
import 'package:gotdirt/app/backend/binding/account_binding.dart';
import 'package:gotdirt/app/backend/binding/add_seller_listing_binding.dart';
import 'package:gotdirt/app/backend/binding/edit_account_binding.dart';
import 'package:gotdirt/app/backend/binding/edit_listing_binding.dart';
import 'package:gotdirt/app/backend/binding/forgot_password_binding.dart';
import 'package:gotdirt/app/backend/binding/home_binding.dart';
import 'package:gotdirt/app/backend/binding/login_binding.dart';
import 'package:gotdirt/app/backend/binding/mapview_binding.dart';
import 'package:gotdirt/app/backend/binding/my_listing_binding.dart';
import 'package:gotdirt/app/backend/binding/new_password_binding.dart';
import 'package:gotdirt/app/backend/binding/post_binding.dart';
import 'package:gotdirt/app/backend/binding/report_binding.dart';
import 'package:gotdirt/app/backend/binding/setting_binding.dart';
import 'package:gotdirt/app/backend/binding/sidemenu_binding.dart';
import 'package:gotdirt/app/backend/binding/signup_binding.dart';
import 'package:gotdirt/app/backend/binding/splash_binding.dart';
import 'package:gotdirt/app/backend/binding/tabs_binding.dart';
import 'package:gotdirt/app/backend/binding/verify_otp_binding.dart';
import 'package:gotdirt/app/backend/binding/welcome_binding.dart';
import 'package:gotdirt/app/controller/edit_listing_controller.dart';
import 'package:gotdirt/app/view/accessibility.dart';
import 'package:gotdirt/app/view/account.dart';
import 'package:gotdirt/app/view/add_seller_listing.dart';
import 'package:gotdirt/app/view/edit_account.dart';
import 'package:gotdirt/app/view/edit_listing.dart';
import 'package:gotdirt/app/view/forgot_password.dart';
import 'package:gotdirt/app/view/home.dart';
import 'package:gotdirt/app/view/login.dart';
import 'package:gotdirt/app/view/mapview.dart';
import 'package:gotdirt/app/view/my_listing.dart';
import 'package:gotdirt/app/view/new_password.dart';
import 'package:gotdirt/app/view/post.dart';
import 'package:gotdirt/app/view/report.dart';
import 'package:gotdirt/app/view/setting.dart';
import 'package:gotdirt/app/view/sidemenu.dart';
import 'package:gotdirt/app/view/signup.dart';
import 'package:gotdirt/app/view/splash.dart';
import 'package:gotdirt/app/view/tabs.dart';
import 'package:gotdirt/app/view/verify_otp.dart';
import 'package:gotdirt/app/view/welcome.dart';

class AppRouter {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String home = '/home';
  static const String signUp = '/signup';
  static const String login = '/login';
  static const String forgotPassword = '/forgotPassword';
  static const String verifyOtp = '/verifyOtp';
  static const String newPassword = '/newpassword';
  static const String account = '/account';
  static const String editAccount = '/editaccount';
  static const String setting = '/setting';
  static const String sideMenu = '/sidemenu';
  static const String post = '/post';
  static const String tabs = '/tabs';
  static const String accessibility = '/accessibility';
  static const String mapview = '/mapview';
  static const String addSellerListing = '/addSellerListing';
  static const String editListing = '/editListing';
  static const String myListing = '/myListing';
  static const String report = '/report';

  static String getInitialRoute() => initial;
  static String getSplashRoute() => splash;
  static String getWelcomeRoute() => welcome;
  static String getHomeRoute() => home;
  static String getSignUpRoute() => signUp;
  static String getLoginRoute() => login;
  static String getForgotPasswordRoute() => forgotPassword;
  static String getVerifyOtpRoute() => verifyOtp;
  static String getNewPasswordRoute() => newPassword;
  static String getAccountRoute() => account;
  static String getEditAccountRoute() => editAccount;
  static String getSettingRoute() => setting;
  static String getSideMenuRoute() => sideMenu;
  static String getPostRoute() => post;
  static String getTabsRoute() => tabs;
  static String getAccessibilityRoute() => accessibility;
  static String getMapViewRoute() => mapview;
  static String getAddSellerListingRoute() => addSellerListing;
  static String getEditListingRoute() => editListing;
  static String getMyListingRoute() => myListing;
  static String getReportRoute() => report;

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => const SplashScreen(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: welcome,
      page: () => const WelcomeScreen(),
      binding: WelcomeBindings(),
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: signUp,
      page: () => const SignUpScreen(),
      binding: SignUpBindings(),
    ),
    GetPage(
      name: login,
      page: () => const LoginScreen(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: forgotPassword,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBindings(),
    ),
    GetPage(
      name: verifyOtp,
      page: () => const VerifyOtpScreen(),
      binding: VerifyOtpBindings(),
    ),
    GetPage(
      name: newPassword,
      page: () => const NewPasswordScreen(),
      binding: NewPasswordBindings(),
    ),
    GetPage(
      name: account,
      page: () => const AccountScreen(),
      binding: AccountBindings(),
    ),
    GetPage(
      name: editAccount,
      page: () => const EditAccountScreen(),
      binding: EditAccountBindings(),
    ),
    GetPage(
      name: setting,
      page: () => const SettingScreen(),
      binding: SettingBindings(),
    ),
    GetPage(
      name: sideMenu,
      page: () => const SideMenuScreen(),
      binding: SideMenuBindings(),
    ),
    GetPage(
      name: post,
      page: () => const PostScreen(),
      binding: PostBindings(),
    ),
    GetPage(
      name: tabs,
      page: () => const BottomTabScreen(),
      binding: TabsBindings(),
    ),
    GetPage(
      name: accessibility,
      page: () => const AccessibilityScreen(),
      binding: AccessibilityBindings(),
    ),
    GetPage(
      name: mapview,
      page: () => const MapviewScreen(),
      binding: MapViewBindings(),
    ),
    GetPage(
      name: addSellerListing,
      page: () => const AddSellerListingScreen(),
      binding: AddSellerListingBinding(),
    ),
    GetPage(
      name: editListing,
      page: () => const EditListingScreen(),
      binding: EditListingBinding(),
    ),
    GetPage(
      name: myListing,
      page: () => const MyListingScreen(),
      binding: MyListingBinding(),
    ),
    GetPage(
      name: report,
      page: () => const ReportScreen(),
      binding: ReportBinding(),
    ),
  ];
}
