import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/new_password_parse.dart';
import 'package:gotdirt/app/common_widget/dialog_widget.dart';
import 'package:gotdirt/app/common_widget/validator_widget.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';

class NewPasswordController extends GetxController implements GetxService {
  final NewPasswordParser parser;
  NewPasswordController({required this.parser});

  final newPasswordTextEditor = TextEditingController();
  final confirmPasswordTextEditor = TextEditingController();

  String email = '';
  String code = '';
  bool resendLoad = true;
  bool loading = true;
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  void onInit() {
    super.onInit();
    // if (Get.arguments[0] != null && Get.arguments[0] != '') {
    //   email = Get.arguments[0];
    //   debugPrint('email:--------- $email');
    // }

    Get.context;
  }

  Future<void> onConfirm() async {
    if (code.length != 6) {
      Get.snackbar(StringText.error, StringText.enterCode,
          colorText: Colors.white);
      return;
    }

    if (newPasswordTextEditor.text == '') {
      Get.snackbar(StringText.error, StringText.enterPassword,
          colorText: Colors.white);
      return;
    }

    if (!newPasswordTextEditor.text.trim().isValidPassword()) {
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

    if (newPasswordTextEditor.text != confirmPasswordTextEditor.text) {
      Get.snackbar(StringText.error, StringText.passwordNotMatch,
          colorText: Colors.white);
      return;
    }

    var param = {
      "email": email,
      "newPassword": newPasswordTextEditor.text.toString(),
      "confirmationCode": code,
    };

    loading = false;
    update();
    Response response = await parser.newPassword(param);
    loading = true;
    update();

    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var msg = myMap["message"];
      Get.snackbar(StringText.success, msg, colorText: Colors.white);
      Get.offNamedUntil(AppRouter.getLoginRoute(), (route) => false);
      newPasswordTextEditor.clear();
      confirmPasswordTextEditor.clear();
      Get.delete<NewPasswordController>(force: true);
      update();
    } else if (response.statusCode == 404 ||
        response.statusCode == 400 ||
        response.statusCode == 500) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var msg = myMap["message"];
      Get.snackbar(StringText.error, msg, colorText: Colors.white);
      update();
    }
  }

  Future<void> onResend() async {
    var param = {
      "email": email,
    };

    resendLoad = false;
    update();
    Response response = await parser.resendCode(param);
    resendLoad = true;
    update();

    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var msg = myMap["message"];
      Get.snackbar(StringText.success, msg, colorText: Colors.white);
      Get.delete<NewPasswordController>(force: true);
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
