import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/sidemenu_parse.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';

class SideMenuController extends GetxController implements GetxService {
  final SideMenuParser parser;
  SideMenuController({required this.parser});
  bool loading = true;
  String accessToken = "";

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> onLogout() async {
    accessToken = parser.getAccessToken();

    var param = {
      "accessToken": accessToken,
    };

    loading = false;
    update();
    Response response = await parser.signOut(param);
    loading = true;
    update();
    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      debugPrint(myMap.toString());
      parser.clearAccount();
      Get.offNamedUntil(AppRouter.getLoginRoute(), (route) => false);
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
