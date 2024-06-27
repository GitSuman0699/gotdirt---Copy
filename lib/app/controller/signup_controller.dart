import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/signup_parse.dart';
import 'package:gotdirt/app/common_widget/dialog_widget.dart';
import 'package:gotdirt/app/common_widget/validator_widget.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';

class SignUpController extends GetxController implements GetxService {
  final SignUpParser parser;
  SignUpController({required this.parser});

  final emailTextEditor = TextEditingController();
  final passwordTextEditor = TextEditingController();
  final confirmPasswordTextEditor = TextEditingController();
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  bool loading = true;

  // SignUpResponseModel _signUpResponseData = SignUpResponseModel();
  // SignUpResponseModel get signUpResponseData => _signUpResponseData;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> onSignUp() async {
    if (emailTextEditor.text == '') {
      Get.snackbar(StringText.error, StringText.enterEmail,
          colorText: Colors.white);
      return;
    }

    if (!emailTextEditor.text.isValidEmail()) {
      Get.snackbar(StringText.error, StringText.emailWarningText,
          colorText: Colors.white);
      return;
    }

    if (passwordTextEditor.text == '') {
      Get.snackbar(StringText.error, StringText.enterPassword,
          colorText: Colors.white);
      return;
    }

    if (!passwordTextEditor.text.trim().isValidPassword()) {
      dialog(
        StringText.passwordRequirements,
        StringText.passwordRequirementsDes,
        '',
        TextAlign.center,
        const SizedBox(),
        Get.context,
      );
      return;
    }

    if (passwordTextEditor.text != confirmPasswordTextEditor.text) {
      Get.snackbar(StringText.error, StringText.passwordNotMatch,
          colorText: Colors.white);
      return;
    }

    var param = {
      "email": emailTextEditor.text.trim(),
      "password": passwordTextEditor.text.trim(),
    };
    loading = false;
    update();
    Response response = await parser.signUp(param);
    loading = true;
    update();

    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      debugPrint(myMap.toString());
      // SignUpResponseModel info = SignUpResponseModel.fromJson(myMap);
      // _signUpResponseData = info;
      // parser.saveUserId(info.data!.user![0].id.toString());
      Get.toNamed(AppRouter.getVerifyOtpRoute(), arguments: [
        emailTextEditor.text.toString(),
        passwordTextEditor.text.toString()
      ]);
      update();
      emailTextEditor.clear();
      passwordTextEditor.clear();
      confirmPasswordTextEditor.clear();
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

  Future<void> facebookSignIn() async {
    try {
      final result = await Amplify.Auth.signInWithWebUI(
        provider: AuthProvider.facebook,
      );
      safePrint('Sign in result: $result');
    } on AuthException catch (e) {
      safePrint('Error signing in: ${e.message}');
    }
    update();
  }
}
