import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/report_parse.dart';

class ReportController extends GetxController implements GetxService {
  final ReportParse parser;
  ReportController({required this.parser});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> menuKey = GlobalKey<FormState>();
}
