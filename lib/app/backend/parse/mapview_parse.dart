import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';

class MapViewParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  MapViewParser(
      {required this.sharedPreferencesManager, required this.apiService});
}
