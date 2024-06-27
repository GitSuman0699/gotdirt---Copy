import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:gotdirt/app/util/theme.dart';

firstAppBar(iconColor, onTap, onTapNotification, context) => PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ThemeProvider.darkGreyColor,
              ThemeProvider.blackColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: AppBar(
          backgroundColor: ThemeProvider.transparentColor,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leading: GestureDetector(
            onTap: onTap ?? () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              size: Theme.of(context).textTheme.headlineMedium?.fontSize,
              color: iconColor ?? ThemeProvider.whiteColor,
            ),
          ),
          title: Text(
            StringText.appName,
            style: TextStyle(
              color: ThemeProvider.whiteColor,
              fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: onTapNotification,
              child: Icon(
                Icons.notifications,
                size: Theme.of(context).textTheme.displaySmall?.fontSize,
                color: ThemeProvider.darkGreyColor,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );

secondAppBar(iconColor, onTap, onTapNotification, context) => PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ThemeProvider.darkGreyColor,
              ThemeProvider.blackColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: AppBar(
          backgroundColor: ThemeProvider.transparentColor,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          leading: GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.menu,
              size: Theme.of(context).textTheme.displaySmall?.fontSize,
              color: iconColor ?? ThemeProvider.blackColor,
            ),
          ),
          title: Text(
            StringText.appName,
            style: TextStyle(
              color: ThemeProvider.whiteColor,
              fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: onTapNotification,
              child: Icon(
                Icons.notifications,
                size: Theme.of(context).textTheme.displaySmall?.fontSize,
                color: ThemeProvider.darkGreyColor,
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );

thirdAppBar(backgroundColor, iconColor, onTap, context) => AppBar(
      backgroundColor: backgroundColor ?? ThemeProvider.appColor,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      leading: GestureDetector(
        onTap: onTap,
        child: Icon(
          Icons.arrow_back_ios,
          size: Theme.of(context).textTheme.displaySmall?.fontSize,
          color: iconColor ?? ThemeProvider.blackColor,
        ),
      ),
      title: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: FadeInImage(
          image: AssetImage(AssetsPath.appLogo2.toString()),
          placeholder: const AssetImage(AssetsPath.placeholder),
          imageErrorBuilder: (context, error, stackTrace) {
            return Image.asset(
              AssetsPath.placeholder,
              fit: BoxFit.contain,
              height: 30,
            );
          },
          fit: BoxFit.contain,
          height: 30,
        ),
      ),
    );

fifthAppBar(backgroundColor, iconColor, onTap, context) => PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ThemeProvider.darkGreyColor,
              ThemeProvider.blackColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: AppBar(
          backgroundColor: ThemeProvider.transparentColor,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Text(
            StringText.appName,
            style: TextStyle(
              color: ThemeProvider.whiteColor,
              fontSize: Theme.of(context).textTheme.headlineLarge?.fontSize,
            ),
          ),
        ),
      ),
    );

fourthAppBar(iconColor, onTap, context) => PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: AppBar(
        backgroundColor: ThemeProvider.transparentColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leading: GestureDetector(
          onTap: onTap ?? () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios,
            size: Theme.of(context).textTheme.displaySmall?.fontSize,
            color: iconColor ?? ThemeProvider.whiteColor,
          ),
        ),
      ),
    );
