import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/home_parse.dart';
import 'package:gotdirt/app/util/string.dart';

class HomeController extends GetxController implements GetxService {
  final HomeParser parser;
  HomeController({required this.parser});

  // UserGetByIdModel _userGetByIdResponseData = UserGetByIdModel();
  // UserGetByIdModel get userGetByIdResponseData => _userGetByIdResponseData;

  int selectAccount = 0;
  int alreadySelected = 0;
  String userId = "";
  String accountType = "";
  bool loading = true;

  @override
  void onInit() {
    super.onInit();
    // accountType = Get.arguments[0];
    // userId = Get.arguments[1];
    // debugPrint('userType :----------------$accountType');
    // if (accountType == StringText.notSelectedUser) {
    //   alreadySelected = 0;
    //   selectAccount = 0;
    // } else if (accountType == StringText.primarySelectedUser) {
    //   alreadySelected = 1;
    //   selectAccount = 1;
    // } else if (accountType == StringText.partnerSelectedUser) {
    //   alreadySelected = 2;
    //   selectAccount = 2;
    // }
  }

  Future<void> onNext() async {
    if (alreadySelected == 0) {
      if (selectAccount == 0) {
        parser.saveUserType(StringText.notSelectedUser);
        Get.snackbar(StringText.error, StringText.selectAtleast,
            colorText: Colors.white);
        debugPrint(
            'account type is ------------------${StringText.notSelectedUser}');
      } else if (selectAccount == 1) {
        parser.saveUserType(StringText.primarySelectedUser);
        debugPrint(
            'account type is ------------------${StringText.primarySelectedUser}');
      } else if (selectAccount == 2) {
        parser.saveUserType(StringText.partnerSelectedUser);
        debugPrint(
            'account type is ------------------${StringText.partnerSelectedUser}');
      }
    } else if (alreadySelected == 1) {
      onAlreadyStartAccount();
    } else if (alreadySelected == 2) {}
    update();
  }

  Future<void> onAlreadyStartAccount() async {
    var param = {
      "id": int.parse(userId),
    };

    loading = false;
    update();
    Response response = await parser.getUniqueCode(param);
    loading = true;
    update();

    if (response.statusCode == 200) {
      debugPrint(response.bodyString);
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      debugPrint(myMap.toString());

      // if (uniqueId == '000000') {
      //   Get.snackbar(StringText.error, StringText.uniqueCode,
      //       colorText: Colors.white);
      // } else {
      //   dialog2(
      //     StringText.accountCreated,
      //     StringText.partnerConnectAccountDes,
      //     uniqueId.toString(),
      //     () {
      //       Clipboard.setData(ClipboardData(text: uniqueId));
      //       Get.snackbar(StringText.success, StringText.copied,
      //           colorText: Colors.white);
      //       update();
      //     },
      //     Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      //       child: MyElevatedButton(
      //         label: StringText.dissmiss,
      //         elevation: 0,
      //         borderColor: ThemeProvider.greyColor,
      //         backgroundColor: ThemeProvider.whiteColor,
      //         textColor: ThemeProvider.blackColor,
      //         onPressed: () {},
      //       ),
      //     ),
      //     Get.context,
      //   );
      // }
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
}
