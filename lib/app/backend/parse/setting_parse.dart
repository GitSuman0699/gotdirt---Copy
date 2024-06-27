import 'package:get/get_connect/http/src/response/response.dart';
import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';
import 'package:gotdirt/app/util/constant.dart';
import 'package:gotdirt/app/util/string.dart';

class SettingParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  SettingParser(
      {required this.sharedPreferencesManager, required this.apiService});
  void clearAccount() {
    sharedPreferencesManager.clearAll();
  }

  String getAccessToken() {
    return sharedPreferencesManager.getString(StringText.accessToken) ?? '';
  }

  Future<Response> signOut(dynamic param) async {
    return await apiService.postPublic(AppConstants.signOut, param);
  }

  String getUID() {
    return sharedPreferencesManager.getString(StringText.userId) ?? '0';
  }

  Future<Response> deleteAccount(dynamic param) async {
    return await apiService.postPublic(AppConstants.deleteUser, param);
  }
}
