import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/login_parse.dart';
import 'package:gotdirt/app/controller/verify_otp_contoller.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';
// import 'package:amazon_cognito_identity_dart_2/cognito.dart' as cg2;

class LoginController extends GetxController implements GetxService {
  final LoginParser parser;
  LoginController({required this.parser});

  final emailTextEditor = TextEditingController();
  final passwordTextEditor = TextEditingController();
  bool passwordVisible = false;
  bool loading = true;

  // LoginResponseModel _loginResponseData = LoginResponseModel();
  // LoginResponseModel get loginResponseData => _loginResponseData;

  final cognitoClientID = '5c95o76pe0bk0uj45tdl71crhv'; //Google/facebook
  final cognitoClientID2 = 'ca6daca5e7cc16d540c2239f368eb7f8'; //facebook change
  final cognitoPoolId = 'us-east-1_SndrBoFPz';
  final cognitoPoolURL = 'oddjobs-dev.auth.us-east-1';
  final cognitoClientSecret =
      'v1fc1rhk7p19mu3m3f2ogjb1cbod8u3skohfe4khad4b5aqth5m';

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> onLogin() async {
    if (emailTextEditor.text.isEmpty) {
      Get.snackbar(StringText.error, StringText.enterEmail,
          colorText: Colors.white);
      return;
    }
    if (passwordTextEditor.text.isEmpty) {
      Get.snackbar(StringText.error, StringText.enterPassword,
          colorText: Colors.white);
      return;
    }

    var param = {
      "email": emailTextEditor.text.trim(),
      "password": passwordTextEditor.text.trim(),
    };
    loading = false;
    update();
    Response response = await parser.login(param);
    loading = true;
    update();
    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      // LoginResponseModel info = LoginResponseModel.fromJson(myMap);
      // _loginResponseData = info;
      // parser.isNewUser(true);
      // var userType = info.data!.profileData![0].type;
      // var userId = info.data!.profileData![0].id.toString();
      // var accessToken = info.data!.accessToken.toString();
      // parser.saveUserId(info.data!.profileData![0].id.toString());
      // parser.saveUserType(userType.toString());
      // parser.saveAccessToken(accessToken.toString());

      debugPrint('userType:11111111111---------------------- $myMap');

      // Get.offNamedUntil(
      //     AppRouter.getHomeRoute(),
      //     arguments: [
      //       userType,
      //       userId,
      //     ],
      //     (route) => false);
      emailTextEditor.clear();
      passwordTextEditor.clear();
      update();
    } else if (response.statusCode == 404 || response.statusCode == 500) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var msg = myMap["message"];
      Get.snackbar(StringText.error, msg, colorText: Colors.white);
      update();
    } else if (response.statusCode == 400) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var msg = myMap["message"];
      if (msg == StringText.userNotConfirmed) {
        // LoginResponseModel info = LoginResponseModel.fromJson(myMap);
        // _loginResponseData = info;
        parser.isNewUser(true);
        // var userType = info.data!.profileData![0].type;
        // var userId = info.data!.profileData![0].id.toString();
        // var accessToken = info.data!.accessToken.toString();
        // parser.saveUserId(userId.toString());
        // parser.saveUserType(userType.toString());
        // parser.saveAccessToken(accessToken.toString());
        onResend(emailTextEditor.text.toString());
      } else {
        Get.snackbar(StringText.error, msg, colorText: Colors.white);
      }
      update();
    } else if (response.statusCode == 401) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var msg = myMap["message"];
      Get.snackbar(StringText.error, msg, colorText: Colors.white);
      update();
    }
    update();
  }

  Future<void> onResend(email) async {
    var param = {
      "email": email,
    };

    loading = false;
    update();
    Response response = await parser.resendCode(param);
    loading = true;
    update();

    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var msg = myMap["message"];
      debugPrint(msg);
      Get.toNamed(AppRouter.getVerifyOtpRoute(), arguments: [
        emailTextEditor.text.toString(),
        passwordTextEditor.text.toString()
      ]);
      Get.delete<VerifyOtpController>(force: true);
      update();
    } else if (response.statusCode == 404 ||
        response.statusCode == 400 ||
        response.statusCode == 500) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var msg = myMap["message"];
      Get.snackbar(StringText.error, msg, colorText: Colors.white);
      update();
    }
    update();
  }

  // Future<void> facebookSignIn() async {
  //   try {
  //     final result =
  //         await Amplify.Auth.signInWithWebUI(provider: AuthProvider.facebook);

  //     safePrint('Sign in result: $result');
  //     debugPrint('Sign in result: $result');
  //   } on AuthException catch (e) {
  //     safePrint('Error signing in: ${e.message}');
  //   }
  //   update();
  // }

  // Future<void> facebookSignIn() async {
  //   try {
  //     bool isConfig = Amplify.isConfigured;
  //     debugPrint('is config $isConfig');
  //     if (isConfig == false) {
  //       await Amplify.addPlugin(AmplifyAuthCognito());
  //       await Amplify.configure(amplifyconfig);
  //     } else {
  //       debugPrint('Already Configured');
  //     }
  //     final result = await Amplify.Auth.signInWithWebUI(
  //       provider: AuthProvider.facebook,
  //     );
  //     safePrint('Sign in result: $result');
  //   } on AuthException catch (e) {
  //     safePrint('Error signing in: ${e.message}');
  //   }
  // }
}
