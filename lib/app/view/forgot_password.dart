import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/common_widget/appbar_widget.dart';
import 'package:gotdirt/app/common_widget/button.dart';
import 'package:gotdirt/app/common_widget/text_form_field.dart';
import 'package:gotdirt/app/controller/forgot_password_controller.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ForgotPasswordController>(
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
                        StringText.forgotPasswordTtl,
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
                        StringText.forgotPasswordMsg2,
                        style: TextStyle(
                          color: ThemeProvider.darkGreyColor,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                      const SizedBox(height: 70),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: MyTextformField(
                          textController: controller.emailTextEditor,
                          hintText: StringText.helperEmail,
                        ),
                      ),
                      const SizedBox(height: 100),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        child: controller.sendCode == false
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: ThemeProvider.appColor,
                                ),
                              )
                            : MyElevatedButton(
                                label: StringText.sendCode,
                                onPressed: () {
                                  Get.toNamed(AppRouter.getNewPasswordRoute());
                                  // controller.onSendCode();
                                },
                              ),
                      ),
                      const SizedBox(height: 150),
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
