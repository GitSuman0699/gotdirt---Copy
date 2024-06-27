import 'package:get/get_connect/http/src/response/response.dart';
import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';
import 'package:gotdirt/app/util/constant.dart';
import 'package:gotdirt/app/util/string.dart';

class SignUpParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  SignUpParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> signUp(dynamic param) async {
    return await apiService.postPublic(AppConstants.signUp, param);
  }

  void saveUserId(String value) {
    sharedPreferencesManager.putString(StringText.userId, value);
  }
}
