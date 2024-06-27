import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/common_widget/appbar_widget.dart';
import 'package:gotdirt/app/common_widget/button.dart';
import 'package:gotdirt/app/common_widget/slider_widget.dart';
import 'package:gotdirt/app/controller/accessibility_controller.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';

class AccessibilityScreen extends StatelessWidget {
  const AccessibilityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccessibilityController>(
      builder: (controller) {
        return Scaffold(
          appBar: firstAppBar(
            ThemeProvider.whiteColor,
            () {
              Get.back();
              controller.update();
            },
            () {},
            context,
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            child: controller.saveLoad == false
                ? const Center(
                    child: CircularProgressIndicator(
                      color: ThemeProvider.appColor,
                    ),
                  )
                : MyElevatedButton(
                    height: 50,
                    label: StringText.save,
                    onPressed: () {},
                  ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringText.accessibilityTtl,
                  style: TextStyle(
                    color: ThemeProvider.blackColor,
                    fontSize:
                        Theme.of(context).textTheme.displaySmall?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  StringText.changeFontSize,
                  style: TextStyle(
                    color: ThemeProvider.blackColor,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: MySlider(
                        controllerValue: controller.value.toDouble(),
                        onChanged: (value) {
                          controller.value = value;
                          debugPrint(controller.value.toString());
                          controller.update();
                        },
                        min: 0.0,
                        max: 100.0,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: -20,
                      child: Text(
                        StringText.fontSize,
                        style: TextStyle(
                          color: ThemeProvider.blackColor,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -25,
                      child: Text(
                        StringText.fontSize,
                        style: TextStyle(
                          color: ThemeProvider.blackColor,
                          fontSize: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.fontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: -30,
                      child: Text(
                        StringText.fontSize,
                        style: TextStyle(
                          color: ThemeProvider.blackColor,
                          fontSize: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.fontSize,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
