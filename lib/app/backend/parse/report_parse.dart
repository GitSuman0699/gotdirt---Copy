import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';

class ReportParse {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ReportParse(
      {required this.sharedPreferencesManager, required this.apiService});
}
