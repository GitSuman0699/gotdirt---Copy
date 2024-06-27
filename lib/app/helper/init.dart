import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/accessibility_parse.dart';
import 'package:gotdirt/app/backend/parse/add_seller_listing_parse.dart';
import 'package:gotdirt/app/backend/parse/edit_listing_parse.dart';
import 'package:gotdirt/app/backend/parse/mapview_parse.dart';
import 'package:gotdirt/app/backend/parse/my_listing_parse.dart';
import 'package:gotdirt/app/backend/parse/post_parse.dart';
import 'package:gotdirt/app/backend/parse/report_parse.dart';
import 'package:gotdirt/app/backend/parse/tabs_parse.dart';
import 'package:gotdirt/app/controller/accessibility_controller.dart';
import 'package:gotdirt/app/controller/add_seller_listing_controller.dart';
import 'package:gotdirt/app/controller/edit_listing_controller.dart';
import 'package:gotdirt/app/controller/mapview_controller.dart';
import 'package:gotdirt/app/controller/my_listing_controller.dart';
import 'package:gotdirt/app/controller/post_controller.dart';
import 'package:gotdirt/app/controller/report_controller.dart';
import 'package:gotdirt/app/controller/tabs_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/backend/parse/account_parse.dart';
import 'package:gotdirt/app/backend/parse/edit_account_parse.dart';
import 'package:gotdirt/app/backend/parse/forgot_password_parse.dart';
import 'package:gotdirt/app/backend/parse/home_parse.dart';
import 'package:gotdirt/app/backend/parse/login_parse.dart';
import 'package:gotdirt/app/backend/parse/new_password_parse.dart';
import 'package:gotdirt/app/backend/parse/setting_parse.dart';
import 'package:gotdirt/app/backend/parse/sidemenu_parse.dart';
import 'package:gotdirt/app/backend/parse/signup_parse.dart';
import 'package:gotdirt/app/backend/parse/splash_parse.dart';
import 'package:gotdirt/app/backend/parse/verify_otp_parse.dart';
import 'package:gotdirt/app/backend/parse/welcome_parse.dart';
import 'package:gotdirt/app/controller/account_controller.dart';
import 'package:gotdirt/app/controller/edit_account_controller.dart';
import 'package:gotdirt/app/controller/forgot_password_controller.dart';
import 'package:gotdirt/app/controller/home_controller.dart';
import 'package:gotdirt/app/controller/login_controller.dart';
import 'package:gotdirt/app/controller/new_password_controller.dart';
import 'package:gotdirt/app/controller/setting_controller.dart';
import 'package:gotdirt/app/controller/sidemenu_controller.dart';
import 'package:gotdirt/app/controller/signup_controller.dart';
import 'package:gotdirt/app/controller/splash_controller.dart';
import 'package:gotdirt/app/controller/verify_otp_contoller.dart';
import 'package:gotdirt/app/controller/welcome_controller.dart';
import 'package:gotdirt/app/env.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';

class MainBinding extends Bindings {
  @override
  Future<void> dependencies() async {
    final sharedPref = await SharedPreferences.getInstance();
    Get.put(
      SharedPreferencesManager(sharedPreferences: sharedPref),
      permanent: true,
    );

    // Parser LazyLoad

    Get.lazyPut(
        () => SplashParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => WelcomeParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => HomeParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => SignUpParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => LoginParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => ForgotPasswordParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => VerifyOtpParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => NewPasswordParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

    Get.lazyPut(
        () => AccountParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => EditAccountParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => SettingParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => SideMenuParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => PostParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => TabsParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => AccessibilityParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => MapViewParser(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => AddSellerListingParse(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => EditListingParse(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => MyListingParse(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);
    Get.lazyPut(
        () => ReportParse(
            apiService: Get.find(), sharedPreferencesManager: Get.find()),
        fenix: true);

    // Getx Put

    Get.lazyPut(() => ApiService(appBaseUrl: Environments.apiBaseURL));
    Get.lazyPut(() => SplashController(parser: Get.find()));
    Get.lazyPut(() => WelcomeController(parser: Get.find()));
    Get.lazyPut(() => HomeController(parser: Get.find()));
    Get.lazyPut(() => SignUpController(parser: Get.find()));
    Get.lazyPut(() => LoginController(parser: Get.find()));
    Get.lazyPut(() => ForgotPasswordController(parser: Get.find()));
    Get.lazyPut(() => VerifyOtpController(parser: Get.find()));
    Get.lazyPut(() => NewPasswordController(parser: Get.find()));
    Get.lazyPut(() => AccountController(parser: Get.find()));
    Get.lazyPut(() => EditAccountController(parser: Get.find()));
    Get.lazyPut(() => SettingController(parser: Get.find()));
    Get.lazyPut(() => SideMenuController(parser: Get.find()));
    Get.lazyPut(() => PostController(parser: Get.find()));
    Get.lazyPut(() => BottomTabsController(parser: Get.find()));
    Get.lazyPut(() => AccessibilityController(parser: Get.find()));
    Get.lazyPut(() => MapViewController(parser: Get.find()));
    Get.lazyPut(() => AddSellerListingController(parser: Get.find()));
    Get.lazyPut(() => EditListingController(parser: Get.find()));
    Get.lazyPut(() => MyListingController(parser: Get.find()));
    Get.lazyPut(() => ReportController(parser: Get.find()));
  }
}
