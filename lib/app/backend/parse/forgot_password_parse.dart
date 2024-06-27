import 'package:get/get_connect/http/src/response/response.dart';
import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';
import 'package:gotdirt/app/util/constant.dart';

class ForgotPasswordParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ForgotPasswordParser(
      {required this.sharedPreferencesManager, required this.apiService});
  Future<Response> forgotPassword(dynamic param) async {
    return await apiService.postPublic(AppConstants.forgotSendCode, param);
  }
}
