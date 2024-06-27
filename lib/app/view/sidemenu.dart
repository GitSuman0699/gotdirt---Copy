import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/common_widget/button.dart';
import 'package:gotdirt/app/common_widget/dialog_widget.dart';
import 'package:gotdirt/app/controller/account_controller.dart';
import 'package:gotdirt/app/controller/sidemenu_controller.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';

class SideMenuScreen extends StatelessWidget {
  const SideMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideMenuController>(
      builder: (controller) {
        return Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(0), bottomRight: Radius.circular(0)),
          ),
          child: Scaffold(
            backgroundColor: ThemeProvider.lightGrey,
            body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Icon(
                          Icons.close,
                          color: ThemeProvider.blackColor,
                          size: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.fontSize,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 20),
                      commonMenu(
                        AssetsPath.location,
                        StringText.browse,
                        () {
                          Get.toNamed(AppRouter.getMapViewRoute());
                        },
                        context,
                      ),
                      commonMenu(
                        AssetsPath.msg,
                        StringText.chat,
                        () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        context,
                      ),
                      commonMenu(
                        AssetsPath.profile,
                        StringText.profile,
                        () {
                          Scaffold.of(context).openEndDrawer();
                          Get.delete<AccountController>(force: true);
                          Get.toNamed(AppRouter.getAccountRoute());
                        },
                        context,
                      ),
                      commonMenu(
                        AssetsPath.settings,
                        StringText.settings,
                        () {
                          Scaffold.of(context).openEndDrawer();
                          Get.toNamed(AppRouter.getSettingRoute());
                        },
                        context,
                      ),
                      commonMenu(
                        AssetsPath.notification,
                        StringText.notification,
                        () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        context,
                      ),
                    ],
                  ),
                  commonMenu(
                    AssetsPath.logout,
                    StringText.logout,
                    () {
                      Scaffold.of(context).openEndDrawer();
                      dialog(
                        StringText.logout,
                        StringText.logoutMsg,
                        '',
                        TextAlign.center,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: GetBuilder<SideMenuController>(
                            builder: (controller) {
                              return controller.loading == false
                                  ? SizedBox(
                                      width: Get.width,
                                      child: const Center(
                                        child: CircularProgressIndicator(
                                          color: ThemeProvider.appColor,
                                        ),
                                      ),
                                    )
                                  : MyElevatedButton(
                                      label: StringText.logout,
                                      elevation: 0,
                                      borderColor:
                                          ThemeProvider.secondaryAppColor,
                                      backgroundColor:
                                          ThemeProvider.secondaryAppColor,
                                      textColor: ThemeProvider.blackColor,
                                      onPressed: () {
                                        controller.onLogout();
                                      },
                                    );
                            },
                          ),
                        ),
                        context,
                      );
                    },
                    context,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

commonMenu(icon, ttl, onTap, context) => ListTile(
      onTap: onTap,
      splashColor: ThemeProvider.transparentColor,
      titleAlignment: ListTileTitleAlignment.center,
      leading: Image.asset(
        icon,
        height: 20,
        width: 20,
        fit: BoxFit.contain,
      ),
      title: Padding(
        padding: const EdgeInsets.only(bottom: 3),
        child: Text(
          ttl,
          style: TextStyle(
            color: ThemeProvider.appColor,
            fontWeight: FontWeight.bold,
            fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
          ),
        ),
      ),
    );
