import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';

class EditListingParse {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  EditListingParse(
      {required this.sharedPreferencesManager, required this.apiService});
}
