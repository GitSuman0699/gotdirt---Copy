import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/common_widget/appbar_widget.dart';
import 'package:gotdirt/app/common_widget/button.dart';
import 'package:gotdirt/app/common_widget/map_page.dart';
import 'package:gotdirt/app/common_widget/text_form_field.dart';
import 'package:gotdirt/app/controller/mapview_controller.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';
import 'package:gotdirt/app/view/sidemenu.dart';

class MapviewScreen extends StatelessWidget {
  const MapviewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapViewController>(
      builder: (controller) {
        return Scaffold(
          // key: controller.scaffoldKey,
          // drawerEnableOpenDragGesture: false,
          // drawer: const SideMenuScreen(),
          // appBar: secondAppBar(
          //   ThemeProvider.whiteColor,
          //   () {
          //     controller.scaffoldKey.currentState?.openDrawer();
          //     controller.update();
          //     // if (controller.showButton) {
          //     //   controller.requestLocation = !controller.requestLocation;

          //     //   // controller.scaffoldKey.currentState?.openDrawer();
          //     //   controller.update();
          //     // }
          //   },
          //   () {
          //     controller.showButton = !controller.showButton;

          //     // controller.scaffoldKey.currentState?.openDrawer();
          //     controller.update();
          //   },
          //   context,
          // ),
          backgroundColor: ThemeProvider.whiteColor,
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(
                            Icons.list_alt_rounded,
                            size: 30.0,
                            color: ThemeProvider.appColorLight,
                          ),
                          onPressed: () {
                            // Handle menu icon press
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 35.0,
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(color: ThemeProvider.shadowGrey),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (controller.selectedChips != 0) {
                                        controller.selectedChips = 0;
                                      }

                                      controller.update();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: controller.selectedChips == 0
                                              ? ThemeProvider.appColorLight
                                              : Colors.white),
                                      child: Center(
                                        child: Text(
                                          StringText.sellers,
                                          style: TextStyle(
                                            color: controller.selectedChips == 0
                                                ? ThemeProvider.whiteColor
                                                : ThemeProvider.appColorLight,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.fontSize,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 5,
                                  child: GestureDetector(
                                    onTap: () {
                                      if (controller.selectedChips != 1) {
                                        controller.selectedChips = 1;
                                      }

                                      controller.update();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          color: controller.selectedChips == 1
                                              ? ThemeProvider.appColorLight
                                              : Colors.white),
                                      child: Center(
                                        child: Text(
                                          StringText.buyers,
                                          style: TextStyle(
                                            color: controller.selectedChips == 1
                                                ? ThemeProvider.whiteColor
                                                : ThemeProvider.appColorLight,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .titleLarge
                                                ?.fontSize,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          icon: const Icon(
                            Icons.filter_list_alt,
                            size: 30.0,
                            color: ThemeProvider.appColorLight,
                          ),
                          onPressed: () {
                            // Handle filter icon press
                            MapViewController.popup.value =
                                !MapViewController.popup.value;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 630,
                  width: Get.width,
                  child: Stack(children: [
                    const MapPage(),
                    Obx(
                      () => Visibility(
                        visible: MapViewController.popup.value,
                        child: const PopupDialog(),
                      ),
                    ),
                    Visibility(
                      visible: controller.showButton,
                      child: Positioned(
                        bottom: 10,
                        left: 20,
                        right: 20,
                        child: Center(
                          child: MyElevatedButton(
                            height: 45,
                            width: 240,
                            onPressed: () {},
                            label: controller.requestLocation
                                ? "Request Location"
                                : "Search Here",
                            backgroundColor: ThemeProvider.blackColor,
                          ),
                        ),
                      ),
                    )
                  ]),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class PopupDialog extends StatelessWidget {
  const PopupDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 20,
      right: 20,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRouter.getReportRoute());
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://via.placeholder.com/150'), // Replace with actual image URL
                      radius: 25,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Jonathan Doe',
                                style: TextStyle(
                                  fontStyle: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.fontStyle,
                                  color: ThemeProvider.blackColor,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "  |  ",
                                style: TextStyle(
                                  color: ThemeProvider.blackColor,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.fontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "@john.doe.23",
                                style: TextStyle(
                                  color: ThemeProvider.greyColor,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.fontSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Near Lehi, Utah',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontStyle: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.fontStyle,
                                  fontSize: 20,
                                ),
                              ),
                              TextSpan(
                                text: "  |  ",
                                style: TextStyle(
                                  color: ThemeProvider.greyColor,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.fontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "3 hours ago",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: ThemeProvider.shadowGrey,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.fontSize,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        MapViewController.popup.value = false;
                      },
                      child: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  StringText.dirtMsgPost,
                  style: TextStyle(
                    color: ThemeProvider.greyColor,
                    fontSize:
                        Theme.of(context).textTheme.headlineMedium?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringText.pickupOrDelivery,
                          style: TextStyle(
                            color: ThemeProvider.greyColor,
                            fontStyle: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontStyle,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Either",
                          style: TextStyle(
                            color: ThemeProvider.blackColor,
                            fontStyle: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontStyle,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontStyle:
                            Theme.of(context).textTheme.titleLarge?.fontStyle,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringText.type,
                          style: TextStyle(
                            color: ThemeProvider.greyColor,
                            fontStyle: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontStyle,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Top Soil",
                          style: TextStyle(
                            color: ThemeProvider.blackColor,
                            fontStyle: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontStyle,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Text(
                      "|",
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontStyle:
                            Theme.of(context).textTheme.titleLarge?.fontStyle,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(
                      width: 15.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringText.amount,
                          style: TextStyle(
                            color: ThemeProvider.greyColor,
                            fontStyle: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontStyle,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "20 cu yds",
                          style: TextStyle(
                            color: ThemeProvider.greyColor,
                            fontStyle: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontStyle,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontStyle:
                        Theme.of(context).textTheme.titleLarge?.fontStyle,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
