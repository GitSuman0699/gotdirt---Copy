import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/my_listing_parse.dart';

class MyListingController extends GetxController implements GetxService {
  final MyListingParse parser;
  MyListingController({required this.parser});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> menuKey = GlobalKey<FormState>();
}
