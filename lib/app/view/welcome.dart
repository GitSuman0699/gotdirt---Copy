import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/common_widget/button.dart';
import 'package:gotdirt/app/controller/welcome_controller.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              const SizedBox(height: 200),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(0),
                  child: FadeInImage(
                    image: AssetImage(AssetsPath.appLogo.toString()),
                    placeholder: AssetImage(AssetsPath.appLogo.toString()),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AssetsPath.appLogo.toString(),
                        fit: BoxFit.cover,
                        height: 180,
                        width: 250,
                      );
                    },
                    fit: BoxFit.cover,
                    height: 180,
                    width: 250,
                  ),
                ),
              ),
              const SizedBox(height: 70),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: MyElevatedButton(
                  label: StringText.signUpUpperCase,
                  onPressed: () {
                    Get.toNamed(AppRouter.getSignUpRoute());
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: MyElevatedButton(
                  label: StringText.logIn,
                  onPressed: () {
                    Get.toNamed(AppRouter.getLoginRoute());
                  },
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        );
      },
    );
  }
}
