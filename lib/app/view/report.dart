import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/common_widget/appbar_widget.dart';
import 'package:gotdirt/app/common_widget/button.dart';
import 'package:gotdirt/app/common_widget/map_page.dart';
import 'package:gotdirt/app/common_widget/text_form_field.dart';
import 'package:gotdirt/app/controller/report_controller.dart';
import 'package:gotdirt/app/helper/router.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReportController>(
      builder: (controller) {
        return Scaffold(
          appBar: firstAppBar(
            ThemeProvider.whiteColor,
            () {
              Get.back();
            },
            () {},
            context,
          ),
          backgroundColor: Colors.grey[200],
          body: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: const EdgeInsets.all(0),
                  color: Colors.grey[100],
                  shape: const ContinuousRectangleBorder(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: Text(
                                "I’ve got 20 yards of dirt, must be able to come pick it up.",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: ThemeProvider.greyColor,
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.fontSize,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: PopupMenuButton(
                                icon: const Icon(Icons.more_vert),
                                key: controller.menuKey,
                                itemBuilder: (_) => <PopupMenuItem<String>>[
                                  PopupMenuItem<String>(
                                    height: 25,
                                    padding: const EdgeInsets.only(
                                      left: 16.0,
                                    ),
                                    onTap: () async {
                                      await Future.delayed(Duration.zero);
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const ReportDialog();
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Report',
                                      style: TextStyle(
                                        color: ThemeProvider.greyColor,
                                        fontSize: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.fontSize,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  color: ThemeProvider.appColor,
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Text(
                                  "Near Lehi, UT",
                                  style: TextStyle(
                                    color: ThemeProvider.greyColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "3 hours ago",
                              style: TextStyle(
                                color: ThemeProvider.greyColor,
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.fontSize,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${StringText.pickupOrDelivery}:",
                                  style: TextStyle(
                                    color: ThemeProvider.greyColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  StringText.pickupOnly,
                                  style: TextStyle(
                                    color: ThemeProvider.blackColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${StringText.type}:",
                                  style: TextStyle(
                                    color: ThemeProvider.greyColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  StringText.topSoil,
                                  style: TextStyle(
                                    color: ThemeProvider.blackColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${StringText.price}:",
                                  style: TextStyle(
                                    color: ThemeProvider.greyColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "\$25",
                                  style: TextStyle(
                                    color: ThemeProvider.blackColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "${StringText.deliveryPrice}:",
                                  style: TextStyle(
                                    color: ThemeProvider.greyColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "\$15",
                                  style: TextStyle(
                                    color: ThemeProvider.blackColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "${StringText.amountHelper}:",
                                  style: TextStyle(
                                    color: ThemeProvider.greyColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4.0,
                                ),
                                Text(
                                  "25 cu yds",
                                  style: TextStyle(
                                    color: ThemeProvider.blackColor,
                                    fontSize: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.fontSize,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                          style: TextStyle(
                            color: ThemeProvider.blackColor,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontSize,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Container(
                  height: Get.height,
                  decoration: const BoxDecoration(color: Colors.white70),
                  child: Column(
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
                        child: SizedBox(
                          height: 340,
                          child: MapPage(),
                        ),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: MyElevatedButton(
                            height: 45,
                            width: Get.width - 100,
                            onPressed: () {
                              Get.toNamed(AppRouter.getAddSellerListingRoute());
                            },
                            label: StringText.contactSeller),
                      )
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

class ReportDialog extends StatelessWidget {
  const ReportDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            StringText.reportPosting,
            style: TextStyle(
              color: ThemeProvider.appColor,
              fontWeight: FontWeight.bold,
              fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            StringText.reportPostingText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: ThemeProvider.appColor,
              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: Get.width,
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: MyTextformField(
                // textController: controller.emailTextEditor,
                hintText: StringText.reportFieldHelper,
                maxLines: 5,
              ),
            ),
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: 200,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.red[800]!, width: 2),
              ),
              onPressed: () {
                // Get.back();
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const BlockConfirmDialog();
                  },
                );
              },
              child: Text(
                StringText.reportButtonText,
                style: TextStyle(
                  color: Colors.red[800],
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          MyElevatedButton(
            height: 45,
            width: 200,
            onPressed: () {
              // Get.back();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const BlockConfirmDialog();
                },
              );
            },
            label: StringText.reportBlockText,
            backgroundColor: Colors.red[800],
          )
        ],
      ),
    );
  }
}

class BlockConfirmDialog extends StatelessWidget {
  const BlockConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  Icons.close,
                  size: 30,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            StringText.confirmBlockPosting,
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(StringText.reportDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ThemeProvider.greyColor,
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
              )),
          const SizedBox(height: 40),
          SizedBox(
            width: 200,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.red[800]!, width: 2),
              ),
              onPressed: () {},
              child: Text(
                "Just Report",
                style: TextStyle(
                  color: Colors.red[800],
                  fontWeight: FontWeight.bold,
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          MyElevatedButton(
            height: 45,
            width: 200,
            onPressed: () {},
            label: 'Confirm Block',
            backgroundColor: Colors.red[800],
          )
        ],
      ),
    );
  }
}
