import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/mapview_parse.dart';

class MapViewController extends GetxController implements GetxService {
  final MapViewParser parser;
  MapViewController({required this.parser});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedChips = 0;

  static RxBool popup = false.obs;
  bool requestLocation = true;
  bool showButton = false;

  // UserGetByIdModel _userGetByIdResponseData = UserGetByIdModel();
  // UserGetByIdModel get userGetByIdResponseData => _userGetByIdResponseData;
}
