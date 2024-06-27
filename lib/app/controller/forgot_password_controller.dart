import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/forgot_password_parse.dart';
import 'package:gotdirt/app/common_widget/validator_widget.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';

class ForgotPasswordController extends GetxController implements GetxService {
  final ForgotPasswordParser parser;
  ForgotPasswordController({required this.parser});

  final emailTextEditor = TextEditingController();
  bool sendCode = true;

  Future<void> onSendCode() async {
    if (emailTextEditor.text == '' || !emailTextEditor.text.isValidEmail()) {
      Get.snackbar(StringText.error, StringText.emailWarningText,
          colorText: Colors.white);
      return;
    }

    var param = {
      "email": emailTextEditor.text.toString(),
    };

    sendCode = false;
    update();
    Response response = await parser.forgotPassword(param);
    sendCode = true;
    update();

    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var msg = myMap["message"];
      Get.snackbar(StringText.success, msg, colorText: Colors.white);
      Get.toNamed(AppRouter.getNewPasswordRoute(), arguments: [
        emailTextEditor.text.toString(),
      ]);
      emailTextEditor.clear();
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
}
