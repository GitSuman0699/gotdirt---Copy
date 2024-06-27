import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gotdirt/app/backend/parse/tabs_parse.dart';

class BottomTabsController extends GetxController implements GetxService {
  final TabsParser parser;
  String homeTitle = 'Home';
  String settingTitle = 'setting';
  String postTitle = 'post';

  late PageController pageController;
  int selectedIndex = 0;
  BottomTabsController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(initialPage: selectedIndex, keepPage: true);
  }

  void onItemTapped(int index) {
    selectedIndex = index;
    pageController.jumpToPage(index);
    update();
  }

  void updateScreen() {
    homeTitle = 'Home';
    settingTitle = 'setting';
    postTitle = 'post';
    // onItemTapped(1);
    update();
  }
}
