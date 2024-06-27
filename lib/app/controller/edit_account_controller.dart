import 'dart:convert';
import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:gotdirt/app/backend/parse/edit_account_parse.dart';
import 'package:gotdirt/app/util/string.dart';

class EditAccountController extends GetxController implements GetxService {
  final EditAccountParser parser;

  EditAccountController({required this.parser});

  // UserGetByIdModel _userGetByIdResponseData = UserGetByIdModel();
  // UserGetByIdModel get userGetByIdResponseData => _userGetByIdResponseData;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final firstNameTextEditor = TextEditingController();
  final lastNameTextEditor = TextEditingController();
  final accountHandleTextEditor = TextEditingController();
  final emailTextEditor = TextEditingController();
  final phoneTextEditor = TextEditingController();
  final cityTextEditor = TextEditingController();
  final zipCodeTextEditor = TextEditingController();

  String? myAgeselect = "Select";
  String? relationStatus = "Select";
  String? yearHowLong = "Select";
  String userId = "";
  String image = "";
  String userType = "";
  bool apiCalled = false;
  bool loading = true;
  bool imgLoad = true;
  int userInfoId = 0;
  int userRelationId = 0;
  XFile? _selectedImage;
  XFile? xImage;

  @override
  void onInit() {
    super.onInit();
    // userId = parser.getUID();
    // debugPrint('userId:--------- $userId');
    // if (userId != "" && userId.isNotEmpty) {
    // }
  }

  Future<void> getAccountDetails() async {
    var param = {
      "id": int.parse(userId),
    };

    Response response = await parser.getRelationalResult(param);
    apiCalled = true;
    update();

    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      // UserGetByIdModel info = UserGetByIdModel.fromJson(myMap);
      // _userGetByIdResponseData = info;
      // firstNameTextEditor.text = info.data!.fName.toString();
      // lastNameTextEditor.text = info.data!.lName.toString();
      // myAgeselect = info.data?.age?.replaceAll(" ", "");
      // relationStatus = info.data?.status?.replaceAll(" ", "");
      // yearHowLong = info.data?.relationshipTime?.toString();
      // userInfoId = info.data!.userInfosId!;
      // userRelationId = info.data!.relationId!;
      // image = info.data!.imageLink.toString();
      // userType = info.data!.type.toString();

      debugPrint('user type -------$myMap');

      update();
    } else if (response.statusCode == 404 ||
        response.statusCode == 400 ||
        response.statusCode == 500) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var msg = myMap["message"];
      Get.snackbar(StringText.error, msg, colorText: Colors.white);
      update();
    }
    update();
  }

  Future<void> onUpdateUserInfo(context) async {
    if (image.isEmpty || image == "") {
      if (xImage == null || xImage!.path.isEmpty) {
        Get.snackbar(StringText.error, StringText.uploadProfile,
            colorText: Colors.white);
        return;
      }
    }

    if (firstNameTextEditor.text.isEmpty) {
      Get.snackbar(StringText.error, StringText.enterFirstName,
          colorText: Colors.white);
      return;
    }
    if (lastNameTextEditor.text.isEmpty) {
      Get.snackbar(StringText.error, StringText.enterLastName,
          colorText: Colors.white);
      return;
    }
    if (myAgeselect == StringText.select) {
      Get.snackbar(StringText.error, StringText.selectYourAgeRange,
          colorText: Colors.white);
      return;
    }

    if (userType == StringText.primarySelectedUser) {
      if (relationStatus == StringText.select) {
        Get.snackbar(StringText.error, StringText.selectRelationStatus,
            colorText: Colors.white);
        return;
      }
      if (yearHowLong == StringText.select) {
        Get.snackbar(StringText.error, StringText.selectYearHowLong,
            colorText: Colors.white);
        return;
      }
    }

    debugPrint('user type -------$userType');

    var param1 = {
      "f_name": firstNameTextEditor.text.toString(),
      "l_name": lastNameTextEditor.text.toString(),
      "id": userId,
      "age": myAgeselect,
      "status": relationStatus,
      "relationship_time": yearHowLong,
      "user_infos_id": userInfoId,
      "relation_id": userRelationId,
    };

    var param2 = {
      "f_name": firstNameTextEditor.text.toString(),
      "l_name": lastNameTextEditor.text.toString(),
      "id": userId,
      "age": myAgeselect,
      "type": userType,
    };

    loading = false;
    update();

    Response response = await parser.updateProfile(
        userType == StringText.primarySelectedUser ? param1 : param2);
    loading = true;
    update();

    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      debugPrint(myMap.toString());

      Navigator.pop(context);
      update();

      firstNameTextEditor.clear();
      lastNameTextEditor.clear();
      myAgeselect = "Select";
      relationStatus = "Select";
      yearHowLong = "Select";
    } else if (response.statusCode == 404 ||
        response.statusCode == 400 ||
        response.statusCode == 500) {
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      var msg = myMap["message"];
      Get.snackbar(StringText.error, msg, colorText: Colors.white);
      update();
    }
    update();
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
