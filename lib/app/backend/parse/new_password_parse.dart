import 'package:get/get_connect/http/src/response/response.dart';
import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';
import 'package:gotdirt/app/util/constant.dart';

class NewPasswordParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  NewPasswordParser(
      {required this.sharedPreferencesManager, required this.apiService});

  Future<Response> resendCode(dynamic param) async {
    return await apiService.postPublic(AppConstants.resendCode, param);
  }

  Future<Response> newPassword(dynamic param) async {
    return await apiService.postPublic(AppConstants.newPassword, param);
  }
}
