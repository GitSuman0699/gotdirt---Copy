import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {'Profile': 'Profile'},
        'hi_IN': {'Profile': 'प्रोफ़ाइल'},
        'es_DE': {'Profile': 'Perfil'},
        'ar_AE': {'Profile': 'حساب تعريفي'},
      };
}
