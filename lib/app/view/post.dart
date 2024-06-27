import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/common_widget/appbar_widget.dart';
import 'package:gotdirt/app/common_widget/button.dart';
import 'package:gotdirt/app/controller/post_controller.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';
import 'package:gotdirt/app/view/sidemenu.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
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
          floatingActionButton: Container(
            decoration: const BoxDecoration(color: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child:

                  //  controller.loading == false
                  //     ? const Center(
                  //         child: CircularProgressIndicator(
                  //           color: ThemeProvider.appColor,
                  //         ),
                  //       )
                  //     :

                  MyElevatedButton(
                height: 50,
                label: StringText.addPost,
                onPressed: () {
                  // controller.onUpdateUserInfo(context);
                },
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,

          // bottomNavigationBar: Container(
          //   decoration: const BoxDecoration(color: Colors.transparent),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          //     child:

          //         //  controller.loading == false
          //         //     ? const Center(
          //         //         child: CircularProgressIndicator(
          //         //           color: ThemeProvider.appColor,
          //         //         ),
          //         //       )
          //         //     :

          //         MyElevatedButton(
          //       label: StringText.addPost,
          //       onPressed: () {
          //         // controller.onUpdateUserInfo(context);
          //       },
          //     ),
          //   ),
          // ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.only(
                      left: 30, right: 30, top: 30.0, bottom: 15),
                  decoration: const BoxDecoration(
                    color: ThemeProvider.whiteColor,
                    boxShadow: [
                      BoxShadow(
                          color: ThemeProvider.whiteColor,
                          offset: Offset(0, 8),
                          blurRadius: 5),
                      BoxShadow(
                        color: ThemeProvider.whiteColor,
                        offset: Offset(-8, 0),
                      ),
                      BoxShadow(
                        color: ThemeProvider.whiteColor,
                        offset: Offset(8, 0),
                      ),
                      BoxShadow(
                        offset: Offset(0.0, 7.0),
                        blurRadius: 30,
                        color: ThemeProvider.shadowGrey,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child: controller.xImage != null
                                    ? Image.file(File(controller.xImage!.path),
                                        width: 90,
                                        height: 90,
                                        fit: BoxFit.cover)
                                    : FadeInImage(
                                        image: const NetworkImage(''),
                                        placeholder: const AssetImage(
                                            AssetsPath.profileHolder),
                                        imageErrorBuilder:
                                            (context, error, stackTrace) {
                                          return Image.asset(
                                            AssetsPath.profileHolder,
                                            fit: BoxFit.cover,
                                            height: 115,
                                            width: 115,
                                          );
                                        },
                                        fit: BoxFit.cover,
                                        height: 110,
                                        width: 110,
                                      ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 0,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: const ShapeDecoration(
                                    shape: CircleBorder(),
                                    color: ThemeProvider.appColor,
                                  ),
                                  child: controller.imgLoad == false
                                      ? const Center(
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: CircularProgressIndicator(
                                              color: ThemeProvider.whiteColor,
                                              strokeWidth: 1,
                                            ),
                                          ),
                                        )
                                      : IconButton(
                                          padding: const EdgeInsets.all(5),
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.edit,
                                            color: ThemeProvider.whiteColor,
                                            size: 20,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Korywn Peck",
                                style: TextStyle(
                                  color: ThemeProvider.blackColor,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.fontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "@korwyn.peck.23",
                                style: TextStyle(
                                  color: ThemeProvider.darkGreyColor,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.fontSize,
                                ),
                              ),
                              const SizedBox(height: 10),
                              SizedBox(
                                width: 150,
                                height: 40,
                                child: MyElevatedButton(
                                  label: StringText.editProfile,
                                  fontSize: 25,
                                  elevation: 0,
                                  borderColor: ThemeProvider.appColor,
                                  backgroundColor: ThemeProvider.whiteColor,
                                  textColor: ThemeProvider.appColor,
                                  onPressed: () {
                                    Get.toNamed(
                                        AppRouter.getEditAccountRoute());
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        StringText.activePost,
                        style: TextStyle(
                          color: ThemeProvider.appColor,
                          fontSize: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.fontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const CustomContainer(),
              ],
            ),
          ),
        );
      },
    );
  }
}

enum SampleItem { itemOne }

SampleItem? selectedItem;

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PostController>(
      builder: (controller) {
        return ListView.builder(
          itemCount: 5,
          padding: const EdgeInsets.only(bottom: 16.0),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                margin: const EdgeInsets.only(top: 20),
                // padding:
                //     const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                  color: ThemeProvider.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: ThemeProvider.whiteColor,
                        offset: Offset(0, 8),
                        blurRadius: 5),
                    BoxShadow(
                      color: ThemeProvider.whiteColor,
                      offset: Offset(-8, 0),
                    ),
                    BoxShadow(
                      color: ThemeProvider.whiteColor,
                      offset: Offset(8, 0),
                    ),
                    BoxShadow(
                      offset: Offset(0.0, 7.0),
                      blurRadius: 30,
                      color: ThemeProvider.shadowGrey,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20.0, top: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 14,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: controller.xImage != null
                                      ? Image.file(
                                          File(controller.xImage!.path),
                                          width: 50,
                                          height: 50,
                                          fit: BoxFit.cover)
                                      : FadeInImage(
                                          image: const NetworkImage(''),
                                          placeholder: const AssetImage(
                                              AssetsPath.profileHolder),
                                          imageErrorBuilder:
                                              (context, error, stackTrace) {
                                            return Image.asset(
                                              AssetsPath.profileHolder,
                                              fit: BoxFit.cover,
                                              height: 50,
                                              width: 50,
                                            );
                                          },
                                          fit: BoxFit.cover,
                                          height: 50,
                                          width: 50,
                                        ),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '${StringText.dummyName} | ',
                                            style: TextStyle(
                                              letterSpacing: 1.1,
                                              fontStyle: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.fontStyle,
                                              color: ThemeProvider.appColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '${'@john.doe.23'} ',
                                            style: TextStyle(
                                              color: ThemeProvider.greyColor,
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.fontSize,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5.0,
                                    ),
                                    RichText(
                                      textAlign: TextAlign.start,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '${'Near Lehi, Utah'} | ',
                                            style: TextStyle(
                                              color: ThemeProvider.greyColor,
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.fontSize,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' ${'3 hours ago'}  ',
                                            style: TextStyle(
                                              fontStyle: FontStyle.italic,
                                              color: ThemeProvider.shadowGrey,
                                              fontSize: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.fontSize,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: PopupMenuButton<SampleItem>(
                              initialValue: selectedItem,
                              position: PopupMenuPosition.under,
                              icon: const Icon(
                                Icons.more_vert,
                                color: ThemeProvider.greyColor,
                                size: 28,
                              ),
                              padding: EdgeInsets.zero,
                              onSelected: (SampleItem item) {
                                selectedItem = item;
                              },
                              itemBuilder: (BuildContext context) =>
                                  <PopupMenuEntry<SampleItem>>[
                                const PopupMenuItem<SampleItem>(
                                  height: 25,
                                  value: SampleItem.itemOne,
                                  child: Text('Opt Out'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Divider(
                      color: Colors.grey[200],
                    ),
                    const SizedBox(height: 5),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        StringText.dirtMsgPost,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringText.pickupOrDrop,
                                  style: TextStyle(
                                    color: ThemeProvider.greyColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.fontSize,
                                  ),
                                ),
                                Text(
                                  StringText.pickupOnly,
                                  style: TextStyle(
                                    color: ThemeProvider.blackColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.fontSize,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringText.type,
                                  style: TextStyle(
                                    color: ThemeProvider.greyColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.fontSize,
                                  ),
                                ),
                                Text(
                                  StringText.topSoil,
                                  style: TextStyle(
                                    color: ThemeProvider.blackColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.fontSize,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringText.amount,
                                  style: TextStyle(
                                    color: ThemeProvider.greyColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.fontSize,
                                  ),
                                ),
                                Text(
                                  '20 yds',
                                  style: TextStyle(
                                    color: ThemeProvider.blackColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.fontSize,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringText.price,
                                  style: TextStyle(
                                    color: ThemeProvider.greyColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.fontSize,
                                  ),
                                ),
                                Text(
                                  '\$25',
                                  style: TextStyle(
                                    color: ThemeProvider.blackColor,
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
                    ),
                    // const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Text(
                        StringText.lorem,
                        style: TextStyle(
                          color: ThemeProvider.greyColor,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
