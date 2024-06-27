import 'package:flutter/material.dart';
import 'package:gotdirt/app/util/theme.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class MyDropDownThirdButton extends StatelessWidget {
  final dynamic value;
  final dynamic onChanged;
  final dynamic items;
  final List list;

  const MyDropDownThirdButton({
    super.key,
    this.value,
    this.onChanged,
    this.items,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ThemeProvider.whiteColor,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isDense: true,
          customButton: Center(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      color: ThemeProvider.greyColor,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          Theme.of(context).textTheme.titleLarge?.fontSize,
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: ThemeProvider.greyColor,
                  size: 24,
                ),
              ],
            ),
          ),
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 0),
          ),
          alignment: AlignmentDirectional.bottomStart,
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 300,
            width: double.infinity,
            elevation: 16,
            useSafeArea: true,
            offset: Offset(0, -10),
            direction: DropdownDirection.right,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: ThemeProvider.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
          menuItemStyleData: MenuItemStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            overlayColor:
                WidgetStateProperty.all(ThemeProvider.transparentColor),
          ),
          value: value,
          onChanged: onChanged,
          items: items ??
              [
                if (!list.contains(value)) ...[
                  DropdownMenuItem(
                    value: value,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: value == list.last
                                    ? ThemeProvider.transparentColor
                                    : ThemeProvider.greyColor)),
                      ),
                      child: Text(
                        value,
                        style: TextStyle(
                          color: ThemeProvider.blackColor,
                          height: 0.7,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                    ),
                  ),
                ],
                for (var i = 0; i < list.length; i++)
                  DropdownMenuItem(
                      value: list[i],
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: list[i] == list.last
                                      ? ThemeProvider.transparentColor
                                      : ThemeProvider.greyColor)),
                        ),
                        child: Text(
                          list[i],
                          style: TextStyle(
                            color: ThemeProvider.blackColor,
                            height: 0.7,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontSize,
                          ),
                        ),
                      ))
              ],
        ),
      ),
    );
  }
}

class MyDropDownSecondButton extends StatelessWidget {
  final dynamic value;
  final dynamic onChanged;
  final dynamic items;
  final List list;

  const MyDropDownSecondButton({
    super.key,
    this.value,
    this.onChanged,
    this.items,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ThemeProvider.whiteColor,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isDense: true,
          customButton: Center(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      color: ThemeProvider.greyColor,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          Theme.of(context).textTheme.titleLarge?.fontSize,
                    ),
                  ),
                ),
                // const Icon(
                //   Icons.keyboard_arrow_down,
                //   color: ThemeProvider.greyColor,
                //   size: 24,
                // ),
              ],
            ),
          ),
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 0),
          ),
          alignment: AlignmentDirectional.bottomStart,
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 500,
            width: double.infinity,
            elevation: 16,
            useSafeArea: true,
            offset: Offset(0, -10),
            direction: DropdownDirection.right,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: ThemeProvider.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
          menuItemStyleData: MenuItemStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            overlayColor:
                WidgetStateProperty.all(ThemeProvider.transparentColor),
          ),
          value: value,
          onChanged: onChanged,

          items: items ??
              [
                if (!list.contains(value)) ...[
                  DropdownMenuItem(
                    value: value,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: value == list.last
                                    ? ThemeProvider.transparentColor
                                    : ThemeProvider.greyColor)),
                      ),
                      child: Text(
                        value,
                        style: TextStyle(
                          color: ThemeProvider.blackColor,
                          height: 0.7,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                    ),
                  ),
                ],
                for (var i = 0; i < list.length; i++)
                  DropdownMenuItem(
                      value: list[i],
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 7, vertical: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: list[i] == list.last
                                      ? ThemeProvider.transparentColor
                                      : ThemeProvider.greyColor)),
                        ),
                        child: Text(
                          list[i],
                          style: TextStyle(
                            color: ThemeProvider.blackColor,
                            height: 0.7,
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.fontSize,
                          ),
                        ),
                      ))
              ],
          //   items: list
          //       .map((ttl) => DropdownMenuItem(
          //           value: ttl,
          //           child: Container(
          //             padding:
          //                 const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
          //             width: double.infinity,
          //             decoration: const BoxDecoration(
          //               border: Border(
          //                   bottom: BorderSide(color: ThemeProvider.greyColor)),
          //             ),
          //             child: Text(
          //               ttl,
          //               style: const TextStyle(
          //                 color: ThemeProvider.blackColor,
          //                 height: 0.7,
          //               ),
          //             ),
          //           )))
          //       .toList(),
        ),
      ),
    );
  }
}

class MyDropDownButton extends StatelessWidget {
  final dynamic value;
  final dynamic onChanged;
  final dynamic items;
  final List list;

  const MyDropDownButton({
    super.key,
    this.value,
    this.onChanged,
    this.items,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ThemeProvider.whiteColor,
        boxShadow: const [
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
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isDense: true,
          customButton: Center(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    value.toString(),
                    style: TextStyle(
                      color: ThemeProvider.greyColor,
                      fontWeight: FontWeight.bold,
                      fontSize:
                          Theme.of(context).textTheme.titleLarge?.fontSize,
                    ),
                  ),
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  color: ThemeProvider.greyColor,
                  size: 24,
                ),
              ],
            ),
          ),
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 0),
          ),
          alignment: AlignmentDirectional.bottomStart,
          dropdownStyleData: const DropdownStyleData(
            maxHeight: 500,
            width: double.infinity,
            elevation: 16,
            useSafeArea: true,
            offset: Offset(0, -10),
            direction: DropdownDirection.right,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: ThemeProvider.whiteColor,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
          ),
          menuItemStyleData: MenuItemStyleData(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            overlayColor:
                WidgetStateProperty.all(ThemeProvider.transparentColor),
          ),
          value: value,
          onChanged: onChanged,
          items: items ??
              [
                if (!list.contains(value)) ...[
                  DropdownMenuItem(
                    value: value,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: value == list.last
                                    ? ThemeProvider.transparentColor
                                    : ThemeProvider.greyColor)),
                      ),
                      child: Text(
                        value,
                        style: TextStyle(
                          color: ThemeProvider.blackColor,
                          height: 0.7,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                    ),
                  ),
                ],
                for (var i = 0; i < list.length; i++)
                  DropdownMenuItem(
                    value: list[i],
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 15),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: list[i] == list.last
                                    ? ThemeProvider.transparentColor
                                    : ThemeProvider.greyColor)),
                      ),
                      child: Text(
                        list[i],
                        style: TextStyle(
                          color: ThemeProvider.blackColor,
                          height: 0.7,
                          fontSize:
                              Theme.of(context).textTheme.titleLarge?.fontSize,
                        ),
                      ),
                    ),
                  ),
              ],
        ),
      ),
    );
  }
}

List ageList = [
  "State",
  "18-24",
  "25-30",
  "31-40",
  "41-50",
  "51-60",
  "61 +",
];

List relationStatusList = [
  "Select",
  "Married",
  "Engaged",
  "Dating",
  "Interested",
  "Other",
];

List yearList = [
  "Select",
  "0-5 years",
  "6-10 years",
  "11-20 years",
  "21-30 years",
  "30-40 years",
  "51+ years",
];

List dirtTypeList = [
  "Select",
  "Coarse",
  "Fine",
  "Fill",
  "Topsoil",
];

List pickupOrDeliveryList = [
  "Select",
  "Pickup",
  "Delivery",
  "Either",
];

List stateList = [
  "State",
  "Alabama",
  "Alaska",
  "Arizona",
];

List aggregateSize = [
  "Select",
];
