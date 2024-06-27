import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';

class PostParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  PostParser(
      {required this.sharedPreferencesManager, required this.apiService});
}
