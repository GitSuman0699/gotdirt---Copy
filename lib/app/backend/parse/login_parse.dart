import 'package:get/get_connect/http/src/response/response.dart';
import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';
import 'package:gotdirt/app/util/constant.dart';
import 'package:gotdirt/app/util/string.dart';

class LoginParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  LoginParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> login(dynamic param) async {
    return await apiService.postPublic(AppConstants.login, param);
  }

  void saveUserId(String value) {
    sharedPreferencesManager.putString(StringText.userId, value);
  }

  void saveUserType(String value) {
    sharedPreferencesManager.putString(StringText.userType, value);
  }

  void isNewUser(bool value) {
    sharedPreferencesManager.putBool(StringText.splashWelcome, value);
  }

  void saveAccessToken(String value) {
    sharedPreferencesManager.putString(StringText.accessToken, value);
  }

  Future<Response> resendCode(dynamic param) async {
    return await apiService.postPublic(AppConstants.resendCode, param);
  }
}
