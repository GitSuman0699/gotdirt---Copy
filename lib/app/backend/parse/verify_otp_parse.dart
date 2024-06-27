import 'package:get/get_connect/http/src/response/response.dart';
import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';
import 'package:gotdirt/app/util/constant.dart';
import 'package:gotdirt/app/util/string.dart';

class VerifyOtpParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  VerifyOtpParser(
      {required this.sharedPreferencesManager, required this.apiService});
  Future<Response> confirmUser(dynamic param) async {
    return await apiService.postPublic(AppConstants.verifyOtp, param);
  }

  Future<Response> resendCode(dynamic param) async {
    return await apiService.postPublic(AppConstants.resendCode, param);
  }

  void saveAccessToken(String token) {
    sharedPreferencesManager.putString(StringText.accessToken, token);
  }

  void isNewUser(bool value) {
    sharedPreferencesManager.putBool(StringText.splashWelcome, value);
  }

  void saveUserType(String value) {
    sharedPreferencesManager.putString(StringText.userType, value);
  }

  String getUID() {
    return sharedPreferencesManager.getString(StringText.userId) ?? '0';
  }
}
