import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/common_widget/button.dart';
import 'package:gotdirt/app/common_widget/text_form_field.dart';
import 'package:gotdirt/app/controller/signup_controller.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ThemeProvider.blackColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
                    child: FadeInImage(
                      image: AssetImage(AssetsPath.appLogo2.toString()),
                      placeholder: AssetImage(AssetsPath.appLogo2.toString()),
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          AssetsPath.appLogo2.toString(),
                          fit: BoxFit.cover,
                          height: 140,
                          width: 183,
                        );
                      },
                      fit: BoxFit.cover,
                      height: 140,
                      width: 183,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height * 0.9,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  decoration: const BoxDecoration(
                      color: ThemeProvider.whiteColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringText.signUp,
                        style: TextStyle(
                          color: ThemeProvider.blackColor,
                          fontSize: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        StringText.msgSignUp,
                        style: TextStyle(
                          color: ThemeProvider.darkGreyColor,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        StringText.email,
                        style: TextStyle(
                          color: ThemeProvider.blackColor,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: MyTextformField(
                          textController: controller.emailTextEditor,
                          hintText: StringText.helperEmail,
                        ),
                      ),
                      Text(
                        StringText.password,
                        style: TextStyle(
                          color: ThemeProvider.blackColor,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: MyTextformField(
                          textController: controller.passwordTextEditor,
                          hintText: StringText.passwordSmall,
                          obscureText:
                              controller.passwordVisible == true ? false : true,
                          // suffixIcon: IconButton(
                          //   onPressed: () {
                          //     controller.passwordVisible =
                          //         !controller.passwordVisible;
                          //     controller.update();
                          //   },
                          //   icon: Icon(
                          //     controller.passwordVisible == false
                          //         ? Icons.visibility
                          //         : Icons.visibility_off,
                          //     color: ThemeProvider.appColor,
                          //   ),
                          // ),
                        ),
                      ),
                      Text(
                        StringText.confirmPassword,
                        style: TextStyle(
                          color: ThemeProvider.blackColor,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0),
                        child: MyTextformField(
                          textController: controller.confirmPasswordTextEditor,
                          hintText: StringText.confirmPasswordSmall,
                          obscureText: controller.confirmPasswordVisible == true
                              ? false
                              : true,
                          // suffixIcon: IconButton(
                          //   onPressed: () {
                          //     controller.confirmPasswordVisible =
                          //         !controller.confirmPasswordVisible;
                          //     controller.update();
                          //   },
                          //   icon: Icon(
                          //     controller.confirmPasswordVisible == false
                          //         ? Icons.visibility
                          //         : Icons.visibility_off,
                          //     color: ThemeProvider.appColor,
                          //   ),
                          // ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: controller.loading == false
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: ThemeProvider.appColor,
                                ),
                              )
                            : MyElevatedButton(
                                label: StringText.signUpUpperCase,
                                onPressed: () {
                                  Get.toNamed(AppRouter.getVerifyOtpRoute());
                                  // controller.onSignUp();
                                },
                              ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(AppRouter.getVerifyOtpRoute());
                                },
                                child: Image.asset(
                                  AssetsPath.googleLogo,
                                  fit: BoxFit.contain,
                                  height: 50,
                                  width: 50,
                                ),
                              ),
                            ),
                          ),
                          Platform.isIOS
                              ? Expanded(
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.toNamed(
                                            AppRouter.getVerifyOtpRoute());
                                      },
                                      child: Image.asset(
                                        AssetsPath.appleLogo,
                                        fit: BoxFit.contain,
                                        height: 50,
                                        width: 50,
                                      ),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                          Expanded(
                            child: Center(
                              child: GestureDetector(
                                onTap: () async {
                                  Get.toNamed(AppRouter.getVerifyOtpRoute());
                                  // await controller.facebookSignIn();
                                  // controller.fetchCognitoAuthSession();
                                },
                                child: Image.asset(
                                  AssetsPath.facebookLogo,
                                  fit: BoxFit.contain,
                                  height: 47,
                                  width: 47,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${StringText.alreadyAccount}  ',
                                  style: TextStyle(
                                    color: ThemeProvider.greyColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.fontSize,
                                  ),
                                ),
                                TextSpan(
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Get.toNamed(AppRouter.getLoginRoute());
                                    },
                                  text: StringText.logIn,
                                  style: TextStyle(
                                    color: ThemeProvider.blackColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
