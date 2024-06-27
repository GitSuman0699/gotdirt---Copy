import 'package:gotdirt/app/backend/api/api.dart';
import 'package:gotdirt/app/helper/shared_pref.dart';

class AddSellerListingParse {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  AddSellerListingParse(
      {required this.sharedPreferencesManager, required this.apiService});
}
