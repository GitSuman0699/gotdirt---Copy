import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/splash_parse.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';

class SplashController extends GetxController implements GetxService {
  final SplashParser parser;
  SplashController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    checkConnectivity();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(AppRouter.getWelcomeRoute());
      // if (parser.isNewUser() == false) {
      //   Get.offNamed(AppRouter.getWelcomeRoute());
      // } else if (parser.isNewUser() == true) {
      //   var userType = parser.isUserType();
      //   var userId = parser.getUID();
      //   debugPrint('userType:------------------------------ $userType');
      //   Get.offNamedUntil(
      //       AppRouter.getHomeRoute(),
      //       arguments: [
      //         userType,
      //         userId,
      //       ],
      //       (route) => false);
      // }
    });
  }

  Future<void> checkConnectivity() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    final hasInternet =
        (connectivityResult.contains(ConnectivityResult.mobile) ||
            connectivityResult.contains(ConnectivityResult.wifi));
    if (!hasInternet) {
      // Get.offAndToNamed(AppRouter.getInitialRoute());
      Get.snackbar(StringText.error, StringText.noInternet,
          colorText: Colors.white);
    }
  }
}
