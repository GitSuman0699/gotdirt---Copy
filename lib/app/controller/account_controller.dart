import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/account_parse.dart';
import 'package:gotdirt/app/util/string.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;

class AccountController extends GetxController implements GetxService {
  final AccountParser parser;

  AccountController({required this.parser});

  // UserAndPartnerRelationModel _userRelationResponseData =
  //     UserAndPartnerRelationModel();
  // UserAndPartnerRelationModel get userRelationResponseData =>
  //     _userRelationResponseData;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final firstNameTextEditor = TextEditingController();
  final lastNameTextEditor = TextEditingController();
  final accountHandleTextEditor = TextEditingController();
  final emailTextEditor = TextEditingController();
  final phoneTextEditor = TextEditingController();
  final cityTextEditor = TextEditingController();
  final zipCodeTextEditor = TextEditingController();

  String? myAgeselect = "State";
  String userId = "";
  String image = "";
  String userType = "";
  bool loading = true;
  bool imgLoad = true;
  bool termsAndCondition = false;
  bool eighteenPlus = false;
  bool apiCalled = false;
  bool accountHandleCheck = false;
  int userInfoId = 0;
  int userRelationId = 0;
  XFile? _selectedImage;
  XFile? xImage;

  @override
  void onInit() {
    super.onInit();
    // userId = parser.getUID();
    // debugPrint('userId:--------- $userId');
    // if (userId != "" && userId.isNotEmpty) {}
  }

  void selectFromGallery(String kind, context) async {
    _selectedImage = await ImagePicker().pickImage(
        source: kind == 'gallery' ? ImageSource.gallery : ImageSource.camera,
        imageQuality: 25);
    xImage = _selectedImage;
    final bytes = io.File(_selectedImage!.path).readAsBytesSync();
    image = base64Encode(bytes);
    debugPrint(image);

    var param = {
      "user_id": userId,
      "type": "image/jpeg",
      "image": image,
    };

    imgLoad = false;
    update();
    Response response = await parser.uploadImage(param);
    imgLoad = true;
    update();

    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      debugPrint(myMap.toString());
      var msg = myMap["message"];
      Get.snackbar(StringText.success, msg, colorText: Colors.white);
      update();
    } else if (response.statusCode == 404 ||
        response.statusCode == 400 ||
        response.statusCode == 500) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var msg = myMap["message"];
      xImage!.path.isEmpty;
      Get.snackbar(StringText.error, msg, colorText: Colors.white);
      update();
    }
    update();
  }
}
