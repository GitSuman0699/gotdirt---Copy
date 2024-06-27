import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';

class AccessibilityParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  AccessibilityParser(
      {required this.sharedPreferencesManager, required this.apiService});
}
