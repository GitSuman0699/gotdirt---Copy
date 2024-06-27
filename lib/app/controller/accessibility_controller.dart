import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/post_parse.dart';

class AccessibilityController extends GetxController implements GetxService {
  final PostParser parser;

  AccessibilityController({required this.parser});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  double value = 50.0;
  bool saveLoad = true;

  @override
  void onInit() {
    super.onInit();
  }
}
