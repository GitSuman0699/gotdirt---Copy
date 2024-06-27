import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/common_widget/appbar_widget.dart';
import 'package:gotdirt/app/common_widget/button.dart';
import 'package:gotdirt/app/common_widget/drop_down_widget.dart';
import 'package:gotdirt/app/common_widget/text_form_field.dart';
import 'package:gotdirt/app/controller/edit_account_controller.dart';
import 'package:gotdirt/app/util/theme.dart';
import '../util/string.dart';

class EditAccountScreen extends StatelessWidget {
  const EditAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditAccountController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ThemeProvider.whiteColor,
          appBar: firstAppBar(
            ThemeProvider.whiteColor,
            () {
              Get.back();
              controller.update();
            },
            () {},
            context,
          ),
          body:

              //  controller.apiCalled == false
              //     ? const Center(
              //         child: CircularProgressIndicator(
              //           color: ThemeProvider.appColor,
              //         ),
              //       )
              //     :

              SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringText.editProfile,
                  style: TextStyle(
                    color: ThemeProvider.blackColor,
                    fontSize:
                        Theme.of(context).textTheme.displaySmall?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Center(
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: controller.xImage != null
                            ? Image.file(File(controller.xImage!.path),
                                width: 100, height: 100, fit: BoxFit.cover)
                            : FadeInImage(
                                image: const NetworkImage(''),
                                placeholder:
                                    const AssetImage(AssetsPath.profileHolder),
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                    AssetsPath.profileHolder,
                                    fit: BoxFit.cover,
                                    height: 100,
                                    width: 100,
                                  );
                                },
                                fit: BoxFit.cover,
                                height: 100,
                                width: 100,
                              ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 0,
                        child: Container(
                          width: 30,
                          height: 30,
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
                                  onPressed: () {
                                    // showCupertinoModalPopup<void>(
                                    //   context: context,
                                    //   builder: (BuildContext context) =>
                                    //       CupertinoActionSheet(
                                    //     title:
                                    //         const Text(StringText.chooseFrom),
                                    //     actions: <CupertinoActionSheetAction>[
                                    //       CupertinoActionSheetAction(
                                    //         isDefaultAction: true,
                                    //         onPressed: () async {
                                    //           var status = await Permission
                                    //               .camera.status;
                                    //           if (status.isDenied) {
                                    //             // ignore: use_build_context_synchronously
                                    //             Navigator.pop(context);
                                    //             Permission.camera.request();
                                    //           } else if (status.isGranted) {
                                    //             // ignore: use_build_context_synchronously
                                    //             Navigator.pop(context);
                                    //             // ignore: use_build_context_synchronously
                                    //             controller.selectFromGallery(
                                    //                 StringText.camera, context);
                                    //           } else if (status
                                    //               .isPermanentlyDenied) {
                                    //             // ignore: use_build_context_synchronously
                                    //             Navigator.pop(context);
                                    //             openAppSettings();
                                    //           }
                                    //         },
                                    //         child: Text(
                                    //           StringText.camera.capitalizeFirst
                                    //               .toString(),
                                    //           style: TextStyle(
                                    //             color: ThemeProvider.appColor,
                                    //             fontSize: Theme.of(context)
                                    //                 .textTheme
                                    //                 .titleLarge
                                    //                 ?.fontSize,
                                    //             fontWeight: FontWeight.normal,
                                    //           ),
                                    //         ),
                                    //       ),
                                    //       CupertinoActionSheetAction(
                                    //         onPressed: () {
                                    //           Navigator.pop(context);
                                    //           controller.selectFromGallery(
                                    //             StringText.gallery,
                                    //             context,
                                    //           );
                                    //         },
                                    //         child: Text(
                                    //           StringText.gallery.capitalizeFirst
                                    //               .toString(),
                                    //           style: TextStyle(
                                    //             color: ThemeProvider.appColor,
                                    //             fontSize: Theme.of(context)
                                    //                 .textTheme
                                    //                 .titleLarge
                                    //                 ?.fontSize,
                                    //             fontWeight: FontWeight.normal,
                                    //           ),
                                    //         ),
                                    //       ),
                                    //       CupertinoActionSheetAction(
                                    //         isDestructiveAction: true,
                                    //         onPressed: () {
                                    //           Navigator.pop(context);
                                    //         },
                                    //         child: Text(
                                    //           StringText.cancel,
                                    //           style: TextStyle(
                                    //             color: ThemeProvider.redColor,
                                    //             fontSize: Theme.of(context)
                                    //                 .textTheme
                                    //                 .titleLarge
                                    //                 ?.fontSize,
                                    //             fontWeight: FontWeight.normal,
                                    //           ),
                                    //         ),
                                    //       )
                                    //     ],
                                    //   ),
                                    // );
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: ThemeProvider.whiteColor,
                                    size: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.fontSize,
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${StringText.fullName}*',
                            style: TextStyle(
                              color: ThemeProvider.darkGreyColor,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.fontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: MyTextformField(
                              textController: controller.firstNameTextEditor,
                              keyboardType: TextInputType.name,
                              inputFormatters: [
                                CapitalizeFirstLetterFormatter(),
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-zA-Z ]')),
                              ],
                              hintText: StringText.firstName,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: MyTextformField(
                              textController: controller.lastNameTextEditor,
                              inputFormatters: [
                                CapitalizeFirstLetterFormatter(),
                                FilteringTextInputFormatter.allow(
                                    RegExp('[a-zA-Z ]')),
                              ],
                              keyboardType: TextInputType.name,
                              hintText: StringText.lastName,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  StringText.contactInfo,
                  style: TextStyle(
                    color: ThemeProvider.darkGreyColor,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: MyTextformField(
                    textController: controller.emailTextEditor,
                    hintText: StringText.helperEmail,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: MyTextformField(
                    textController: controller.phoneTextEditor,
                    keyboardType: TextInputType.phone,
                    hintText: StringText.phoneNumber,
                  ),
                ),
                Text(
                  StringText.location,
                  style: TextStyle(
                    color: ThemeProvider.darkGreyColor,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: MyTextformField(
                    textController: controller.cityTextEditor,
                    hintText: StringText.city,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: MyDropDownButton(
                        value: controller.myAgeselect,
                        list: ageList,
                        onChanged: (value) {
                          controller.myAgeselect = value;
                          controller.update();
                        },
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MyTextformField(
                            textController: controller.zipCodeTextEditor,
                            keyboardType: TextInputType.number,
                            hintText: StringText.zipCode,
                          ),
                          Text(
                            '*${StringText.required}',
                            style: TextStyle(
                              color: ThemeProvider.redColor,
                              fontSize: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.fontSize,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                    label: StringText.done,
                    onPressed: () {
                      // controller.onUpdateUserInfo(context);
                      Get.toNamed(AppRouter.getPostRoute());
                    },
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
