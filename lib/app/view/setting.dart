import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/common_widget/appbar_widget.dart';
import 'package:gotdirt/app/common_widget/button.dart';
import 'package:gotdirt/app/common_widget/dialog_widget.dart';
import 'package:gotdirt/app/common_widget/web_lunch_widget.dart';
import 'package:gotdirt/app/controller/setting_controller.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';
import 'package:gotdirt/app/view/sidemenu.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ThemeProvider.whiteColor,
          // key: controller.scaffoldKey,
          // drawerEnableOpenDragGesture: false,
          // drawer: const SideMenuScreen(),
          // appBar: secondAppBar(
          //   ThemeProvider.whiteColor,
          //   () {
          //     controller.scaffoldKey.currentState?.openDrawer();
          //     controller.update();
          //   },
          //   () {},
          //   context,
          // ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: controller.deleteLoad == false
                ? const Center(
                    child: CircularProgressIndicator(
                      color: ThemeProvider.appColor,
                    ),
                  )
                : MyElevatedButton(
                    label: StringText.deleteAccount,
                    elevation: 0,
                    borderColor: ThemeProvider.redColor,
                    backgroundColor: ThemeProvider.whiteColor,
                    textColor: ThemeProvider.redColor,
                    onPressed: () {
                      dialog(
                        StringText.deleteAccount,
                        StringText.deleteAccountDes,
                        '',
                        TextAlign.center,
                        GetBuilder<SettingController>(
                          builder: (controller) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: MyElevatedButton(
                                label: StringText.deleteAccount,
                                elevation: 0,
                                borderColor: ThemeProvider.redColor,
                                backgroundColor: ThemeProvider.redColor,
                                textColor: ThemeProvider.whiteColor,
                                onPressed: () {
                                  controller.onDeleteAccount();
                                },
                              ),
                            );
                          },
                        ),
                        Get.context,
                      );
                    },
                  ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringText.settings,
                  style: TextStyle(
                    color: ThemeProvider.blackColor,
                    fontSize:
                        Theme.of(context).textTheme.displaySmall?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                const Divider(
                  color: ThemeProvider.greyColor,
                ),
                GestureDetector(
                  onTap: () {
                    launchInBrowser(Uri.parse(WebUrl.termsConditions));
                    controller.update();
                  },
                  child: commonTitle(StringText.termsAndConditions, context),
                ),
                GestureDetector(
                  onTap: () {
                    launchInBrowser(Uri.parse(WebUrl.privacyPolicy));
                    controller.update();
                  },
                  child: commonTitle(StringText.privacyPolicy, context),
                ),
                GestureDetector(
                  onTap: () {
                    // launchInBrowser(Uri.parse(WebUrl.contactUs));
                    // controller.update();
                  },
                  child: commonTitle(StringText.contactUs, context),
                ),
                commonTitle(StringText.rateApp, context),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRouter.getAccessibilityRoute());
                  },
                  child: commonTitle(StringText.accessibility, context),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}

commonTitle(ttl, context) => Container(
      width: Get.width,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: ThemeProvider.greyColor),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              ttl,
              style: TextStyle(
                color: ThemeProvider.darkGreyColor,
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: ThemeProvider.greyColor,
          ),
        ],
      ),
    );
