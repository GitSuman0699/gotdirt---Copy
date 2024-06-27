import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/setting_parse.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';

class SettingController extends GetxController implements GetxService {
  final SettingParser parser;

  SettingController({required this.parser});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool loading = true;
  bool deleteLoad = true;
  String accessToken = "";
  String userId = "";

  @override
  void onInit() {
    super.onInit();
    userId = parser.getUID();
    accessToken = parser.getAccessToken();
  }

  Future<void> onLogout() async {
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

  Future<void> onDeleteAccount() async {
    var param = {
      "id": int.parse(userId),
    };

    deleteLoad = false;
    update();
    Response response = await parser.deleteAccount(param);
    deleteLoad = true;
    update();

    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var msg = myMap["message"];
      debugPrint(msg);
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
