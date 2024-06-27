import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/verify_otp_parse.dart';

class VerifyOtpController extends GetxController implements GetxService {
  final VerifyOtpParser parser;
  VerifyOtpController({required this.parser});

  String? email = '';
  String? password = '';
  String code = '';
  bool loading = true;
  bool resendLoad = true;

  // VerifyOtpResponseModel _verifyOtpResponseData = VerifyOtpResponseModel();
  // VerifyOtpResponseModel get verifyOtpResponseData => _verifyOtpResponseData;

  @override
  void onInit() {
    super.onInit();
    // email = Get.arguments[0];
    // password = Get.arguments[1];
    // debugPrint('email:--------- $email, password:------------ $password');
  }

//   Future<void> onVerify() async {
//     if (code.length != 6) {
//       Get.snackbar(StringText.error, StringText.enterCode,
//           colorText: Colors.white);
//       return;
//     }

//     var param = {
//       "email": email,
//       "password": password,
//       "code": code,
//     };

//     loading = false;
//     update();
//     Response response = await parser.confirmUser(param);
//     loading = true;
//     update();

//     if (response.statusCode == 200) {
//       debugPrint(response.bodyString);
//       Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
//       debugPrint(myMap.toString());
//       // VerifyOtpResponseModel info = VerifyOtpResponseModel.fromJson(myMap);
//       // _verifyOtpResponseData = info;
//       var userId = parser.getUID();
//       // var accessToken = info.data!.accessToken;
//       // parser.saveAccessToken(accessToken.toString());
//       // parser.isNewUser(true);
//       parser.saveUserType(StringText.notSelectedUser.toString());
//       Get.offNamedUntil(
//           AppRouter.getHomeRoute(),
//           arguments: [
//             StringText.notSelectedUser.toString(),
//             userId,
//           ],
//           (route) => false);
//       Get.delete<VerifyOtpController>(force: true);
//       update();
//     } else if (response.statusCode == 404 ||
//         response.statusCode == 400 ||
//         response.statusCode == 500) {
//       Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
//       var msg = myMap["message"];
//       Get.snackbar(StringText.error, msg, colorText: ThemeProvider.whiteColor);
//       update();
//     }
//     update();
//   }

//   Future<void> onResend() async {
//     var param = {
//       "email": email,
//     };

//     resendLoad = false;
//     update();
//     Response response = await parser.resendCode(param);
//     resendLoad = true;
//     update();

//     if (response.statusCode == 200) {
//       debugPrint(response.bodyString);
//       Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
//       var msg = myMap["message"];
//       Get.snackbar(StringText.success, msg,
//           colorText: ThemeProvider.whiteColor);
//       Get.delete<VerifyOtpController>(force: true);
//       update();
//     } else if (response.statusCode == 404 ||
//         response.statusCode == 400 ||
//         response.statusCode == 500) {
//       Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
//       var msg = myMap["message"];
//       Get.snackbar(StringText.error, msg, colorText: ThemeProvider.whiteColor);
//       update();
//     }
//     update();
//   }
}
