import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/common_widget/appbar_widget.dart';
import 'package:gotdirt/app/common_widget/button.dart';
import 'package:gotdirt/app/controller/verify_otp_contoller.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerifyOtpController>(
      builder: (controller) {
        return Scaffold(
          appBar: fourthAppBar(
            ThemeProvider.blackColor,
            () {
              Get.back();
            },
            context,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
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
                const SizedBox(height: 50),
                Container(
                  height: Get.height * 0.8,
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
                        StringText.verifyOtpTtl,
                        style: TextStyle(
                          color: ThemeProvider.blackColor,
                          fontSize: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        '${StringText.verifyOtpMsg2} ${controller.email}',
                        style: TextStyle(
                          color: ThemeProvider.darkGreyColor,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                      const SizedBox(height: 50),
                      OtpTextField(
                        fieldHeight: 45,
                        fieldWidth: 45,
                        numberOfFields: 6,
                        textStyle: TextStyle(
                          height: 0.8,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                        alignment: Alignment.center,
                        borderColor: ThemeProvider.greyColor,
                        disabledBorderColor: ThemeProvider.greyColor,
                        enabledBorderColor: ThemeProvider.greyColor,
                        focusedBorderColor: ThemeProvider.appColor,
                        cursorColor: ThemeProvider.appColor,
                        showFieldAsBox: true,
                        clearText: false,
                        onSubmit: (String verificationCode) {
                          debugPrint(verificationCode.toString());
                          controller.code = verificationCode;
                          controller.update();
                        },
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '${StringText.didntReceiveCode}  ',
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
                                      if (controller.resendLoad == true) {
                                        // controller.onResend();
                                        // controller.onResend();
                                      }
                                    },
                                  text: controller.resendLoad == false
                                      ? StringText.pleaseWait
                                      : StringText.resend,
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
                      const SizedBox(height: 80),
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
                                label: StringText.verify,
                                onPressed: () {
                                  Get.offNamed(AppRouter.getAccountRoute());
                                  // controller.onVerify();
                                },
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: MyElevatedButton(
                          label: StringText.changeEmail,
                          elevation: 0,
                          backgroundColor: ThemeProvider.whiteColor,
                          textColor: ThemeProvider.blackColor,
                          onPressed: () {
                            Get.offNamed(AppRouter.getSignUpRoute());
                          },
                        ),
                      ),
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
