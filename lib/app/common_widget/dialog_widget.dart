import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';

dialog(
  ttl,
  des,
  middleWidgetText,
  textAlign,
  widget,
  context,
) {
  Get.dialog(
    AlertDialog(
      backgroundColor: ThemeProvider.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.close,
                  color: ThemeProvider.greyColor,
                  size: Theme.of(context).textTheme.displaySmall?.fontSize,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              ttl,
              textAlign: textAlign ?? TextAlign.center,
              style: TextStyle(
                color: ThemeProvider.darkGreyColor,
                fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 30),
          Text(
            des,
            style: TextStyle(
              color: ThemeProvider.darkGreyColor,
              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
            ),
          ),
          middleWidgetText == ''
              ? const SizedBox()
              : const SizedBox(height: 10),
          middleWidgetText == ''
              ? const SizedBox()
              : Text(
                  middleWidgetText,
                  style: TextStyle(
                    color: ThemeProvider.darkGreyColor,
                    fontSize:
                        Theme.of(context).textTheme.displaySmall?.fontSize,
                  ),
                ),
          const SizedBox(height: 30),
          widget ?? const SizedBox(),
        ],
      ),
    ),
  );
}

dialog2(
  ttl,
  des,
  middleWidgetText,
  copyOnTap,
  widget,
  context,
) {
  Get.dialog(
    AlertDialog(
      backgroundColor: ThemeProvider.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  Icons.close,
                  color: ThemeProvider.greyColor,
                  size: Theme.of(context).textTheme.displaySmall?.fontSize,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            ttl,
            style: TextStyle(
              color: ThemeProvider.blackColor,
              fontSize: Theme.of(context).textTheme.displaySmall?.fontSize,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Text(
              des,
              style: TextStyle(
                color: ThemeProvider.darkGreyColor,
                fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
              ),
            ),
          ),
          middleWidgetText == ''
              ? const SizedBox()
              : const SizedBox(height: 10),
          middleWidgetText == ''
              ? const SizedBox()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      middleWidgetText,
                      style: TextStyle(
                        color: ThemeProvider.darkGreyColor,
                        fontSize:
                            Theme.of(context).textTheme.displaySmall?.fontSize,
                      ),
                    ),
                    const SizedBox(width: 5),
                    GestureDetector(
                      onTap: copyOnTap,
                      child: Image.asset(
                        AssetsPath.copy,
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 30),
          widget ?? const SizedBox(),
        ],
      ),
    ),
  );
}
