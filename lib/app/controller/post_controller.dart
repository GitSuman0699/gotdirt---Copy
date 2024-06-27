import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/post_parse.dart';
import 'package:image_picker/image_picker.dart';

class PostController extends GetxController implements GetxService {
  final PostParser parser;

  PostController({required this.parser});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  XFile? selectedImage;
  XFile? xImage;
  bool imgLoad = true;
  String image = "";

  @override
  void onInit() {
    super.onInit();
  }
}
