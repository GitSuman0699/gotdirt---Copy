import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/common_widget/appbar_widget.dart';
import 'package:gotdirt/app/common_widget/button.dart';
import 'package:gotdirt/app/common_widget/dialog_widget.dart';
import 'package:gotdirt/app/common_widget/text_form_field.dart';
import 'package:gotdirt/app/controller/new_password_controller.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewPasswordController>(
      builder: (controller) {
        return Scaffold(
          appBar: fourthAppBar(
            ThemeProvider.blackColor,
            () {},
            context,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Center(
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(0),
                //     child: FadeInImage(
                //       image: AssetImage(AssetsPath.appLogo.toString()),
                //       placeholder: AssetImage(AssetsPath.appLogo.toString()),
                //       imageErrorBuilder: (context, error, stackTrace) {
                //         return Image.asset(
                //           AssetsPath.appLogo.toString(),
                //           fit: BoxFit.cover,
                //           height: 140,
                //           width: 183,
                //         );
                //       },
                //       fit: BoxFit.cover,
                //       height: 140,
                //       width: 183,
                //     ),
                //   ),
                // ),
                const SizedBox(height: 100),
                Container(
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
                        StringText.createNewPasswordTtl,
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
                      const SizedBox(height: 20),
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
                        onSubmit: (String verificationCode) {
                          debugPrint(verificationCode.toString());
                          controller.code = verificationCode;
                          controller.update();
                        },
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
                                        controller.onResend();
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
                      const SizedBox(height: 30),
                      Text(
                        StringText.createNewPasswordMsg,
                        style: TextStyle(
                          color: ThemeProvider.darkGreyColor,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            StringText.newPassword,
                            style: TextStyle(
                              color: ThemeProvider.blackColor,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.fontSize,
                            ),
                          ),
                          const SizedBox(width: 10),
                          GestureDetector(
                            onTap: () {
                              dialog(
                                StringText.passwordRequirements,
                                StringText.passwordRequirementsDes,
                                '',
                                TextAlign.center,
                                const SizedBox(),
                                Get.context,
                              );
                            },
                            child: const Icon(
                              Icons.info_outline,
                              color: ThemeProvider.blackColor,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: MyTextformField(
                          textController: controller.newPasswordTextEditor,
                          hintText: StringText.newPassword,
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
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: MyTextformField(
                          textController: controller.confirmPasswordTextEditor,
                          hintText: StringText.newPassword,
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
                      const SizedBox(height: 30),
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
                                label: StringText.confirm,
                                onPressed: () {
                                  Get.offNamedUntil(AppRouter.getLoginRoute(),
                                      (route) => false);
                                  // controller.onConfirm();
                                },
                              ),
                      ),
                      const SizedBox(height: 100),
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
