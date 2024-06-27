import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/common_widget/appbar_widget.dart';
import 'package:gotdirt/app/common_widget/button.dart';
import 'package:gotdirt/app/common_widget/drop_down_widget.dart';
import 'package:gotdirt/app/common_widget/text_form_field.dart';
import 'package:gotdirt/app/controller/add_seller_listing_controller.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';

class EditListingScreen extends StatelessWidget {
  const EditListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddSellerListingController>(
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
          backgroundColor: ThemeProvider.whiteColor,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  StringText.editListing,
                  style: TextStyle(
                    color: ThemeProvider.blackColor,
                    fontSize:
                        Theme.of(context).textTheme.displaySmall?.fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  StringText.listingTitle,
                  style: TextStyle(
                    color: ThemeProvider.blackColor,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: MyTextformField(
                    // textController: controller.emailTextEditor,
                    hintText: StringText.helperListingTitle,
                  ),
                ),
                Text(
                  StringText.listingDescription,
                  style: TextStyle(
                    color: ThemeProvider.blackColor,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: MyTextformField(
                    maxLines: 5,
                    // textController: controller.emailTextEditor,
                    hintText: StringText.listingDescription,
                  ),
                ),
                Text(
                  StringText.price,
                  style: TextStyle(
                    color: ThemeProvider.blackColor,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        "\$",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 148, 147, 147),
                          fontSize: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.fontSize,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: MyTextformField(
                          // textController: controller.emailTextEditor,
                          hintText: StringText.price,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  StringText.dirtType,
                  style: TextStyle(
                    color: ThemeProvider.blackColor,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 5.0),
                  child: MyDropDownButton(
                    value: controller.dirtTypeSelect,
                    list: dirtTypeList,
                    onChanged: (value) {
                      controller.dirtTypeSelect = value;
                      controller.update();
                    },
                  ),
                ),
                Text(
                  StringText.amount,
                  style: TextStyle(
                    color: ThemeProvider.greyColor,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: MyTextformField(
                          // textController: controller.emailTextEditor,
                          hintText: StringText.amountHelper,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 216, 213, 213),
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "cubic yds",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 148, 147, 147),
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  StringText.pickupOrDelivery,
                  style: TextStyle(
                    color: ThemeProvider.blackColor,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0, top: 5.0),
                  child: MyDropDownButton(
                    value: controller.pickupOrDeliverySelect,
                    list: pickupOrDeliveryList,
                    onChanged: (value) {
                      controller.pickupOrDeliverySelect = value;
                      controller.update();
                    },
                  ),
                ),
                Visibility(
                  visible: controller.pickupOrDeliverySelect == "Delivery",
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringText.deliveryPrice,
                        style: TextStyle(
                          color: ThemeProvider.blackColor,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "\$",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 148, 147, 147),
                                fontSize: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.fontSize,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 7,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: MyTextformField(
                                // textController: controller.emailTextEditor,
                                hintText: StringText.price,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        StringText.deliveryRange,
                        style: TextStyle(
                          color: ThemeProvider.greyColor,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: MyTextformField(
                                // textController: controller.emailTextEditor,
                                hintText: "Distance",
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 216, 213, 213),
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 8,
                              child: Text(
                                "in miles",
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 148, 147, 147),
                                  fontSize: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.fontSize,
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  StringText.location,
                  style: TextStyle(
                    color: ThemeProvider.blackColor,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: MyTextformField(
                    // textController: controller.emailTextEditor,
                    hintText: StringText.streetAddress,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: MyTextformField(
                    // textController: controller.emailTextEditor,
                    hintText: StringText.city,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: MyDropDownButton(
                          value: controller.stateSelect,
                          list: stateList,
                          onChanged: (value) {
                            controller.stateSelect = value;
                            controller.update();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Expanded(
                      flex: 5,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: MyTextformField(
                          // textController: controller.emailTextEditor,
                          hintText: StringText.zipCode,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(Colors.grey[100]),
                      shape: WidgetStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                        ),
                      ),
                    ),
                    onPressed: null,
                    child: Text(
                      "Drop a Pin",
                      style: TextStyle(
                        color: Colors.grey[300],
                        fontSize:
                            Theme.of(context).textTheme.titleLarge?.fontSize,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringText.cleanlinessOfDirt,
                      style: TextStyle(
                        color: ThemeProvider.blackColor,
                        fontSize:
                            Theme.of(context).textTheme.titleLarge?.fontSize,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (controller.selectedChips.contains(0)) {
                              controller.selectedChips.remove(0);
                            } else {
                              controller.selectedChips.add(0);
                            }

                            controller.update();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: controller.selectedChips.contains(0)
                                  ? Colors.black45
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 10.0),
                              child: Text(
                                "Clean",
                                style: TextStyle(
                                  color: controller.selectedChips.contains(0)
                                      ? Colors.white
                                      : Colors.black45,
                                  fontSize: Theme.of(Get.context!)
                                      .textTheme
                                      .titleLarge
                                      ?.fontSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (controller.selectedChips.contains(1)) {
                              controller.selectedChips.remove(1);
                            } else {
                              controller.selectedChips.add(1);
                            }

                            controller.update();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: controller.selectedChips.contains(1)
                                  ? Colors.black45
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 10.0),
                              child: Text(
                                "Rock Free",
                                style: TextStyle(
                                  color: controller.selectedChips.contains(1)
                                      ? Colors.white
                                      : Colors.black45,
                                  fontSize: Theme.of(Get.context!)
                                      .textTheme
                                      .titleLarge
                                      ?.fontSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (controller.selectedChips.contains(2)) {
                              controller.selectedChips.remove(2);
                            } else {
                              controller.selectedChips.add(2);
                            }

                            controller.update();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: controller.selectedChips.contains(2)
                                  ? Colors.black45
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 10.0),
                              child: Text(
                                "Rotting Matter-Free",
                                style: TextStyle(
                                  color: controller.selectedChips.contains(2)
                                      ? Colors.white
                                      : Colors.black45,
                                  fontSize: Theme.of(Get.context!)
                                      .textTheme
                                      .titleLarge
                                      ?.fontSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (controller.selectedChips.contains(3)) {
                              controller.selectedChips.remove(3);
                            } else {
                              controller.selectedChips.add(3);
                            }

                            controller.update();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: controller.selectedChips.contains(3)
                                  ? Colors.black45
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 10.0),
                              child: Text(
                                "Plastic & debris-free",
                                style: TextStyle(
                                  color: controller.selectedChips.contains(3)
                                      ? Colors.white
                                      : Colors.black45,
                                  fontSize: Theme.of(Get.context!)
                                      .textTheme
                                      .titleLarge
                                      ?.fontSize,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 21.0,
                ),
                Text(
                  StringText.aggregateSize,
                  style: TextStyle(
                    color: ThemeProvider.blackColor,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: MyDropDownButton(
                    value: controller.aggregateSelect,
                    list: aggregateSize,
                    onChanged: (value) {
                      controller.aggregateSelect = value;
                      controller.update();
                    },
                  ),
                ),
                const SizedBox(
                  height: 21.0,
                ),
                Text(
                  StringText.shoppersWillSee,
                  style: TextStyle(
                    color: ThemeProvider.greyColor,
                    fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                  ),
                ),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.checkbox1.value,
                        onChanged: (value) {
                          controller.checkbox1.value = value!;
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "City only, I can send interested shoppers my location when I’m ready",
                        maxLines: 2,
                        style: TextStyle(
                          color: ThemeProvider.greyColor,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.checkbox2.value,
                        onChanged: (value) {
                          controller.checkbox2.value = value!;
                        },
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Whole location, all shoppers can see my address so they can stop by whenever",
                        maxLines: 2,
                        style: TextStyle(
                          color: ThemeProvider.greyColor,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 36.0,
                ),
                Center(
                  child: MyElevatedButton(
                      width: Get.width - 120,
                      onPressed: () {
                        Get.back();
                      },
                      label: "Done"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
