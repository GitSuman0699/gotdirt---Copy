import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/controller/splash_controller.dart';
import 'package:gotdirt/app/util/string.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) {
        return Scaffold(
          body: Center(
            child: Image.asset(
              AssetsPath.appLogo.toString(),
              fit: BoxFit.cover,
              height: 180,
              width: 250,
            ),
          ),
        );
      },
    );
  }
}
