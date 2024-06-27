import 'package:get/get_connect/http/src/response/response.dart';
import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';
import 'package:gotdirt/app/util/constant.dart';
import 'package:gotdirt/app/util/string.dart';

class HomeParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  HomeParser(
      {required this.sharedPreferencesManager, required this.apiService});
  Future<Response> getUniqueCode(dynamic param) async {
    return await apiService.postPublic(AppConstants.userById, param);
  }

  void saveUserType(String value) {
    sharedPreferencesManager.putString(StringText.userType, value);
  }
}
