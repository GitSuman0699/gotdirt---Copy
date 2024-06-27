import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';
import 'package:gotdirt/app/util/string.dart';

class SplashParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  SplashParser(
      {required this.sharedPreferencesManager, required this.apiService});

  bool isNewUser() {
    return sharedPreferencesManager.getBool(StringText.splashWelcome);
  }

  String isUserType() {
    return sharedPreferencesManager.getString(StringText.userType) ??
        StringText.notSelectedUser;
  }

  String getUID() {
    return sharedPreferencesManager.getString(StringText.userId) ?? '0';
  }
}
