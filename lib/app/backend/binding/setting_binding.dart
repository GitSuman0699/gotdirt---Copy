import 'package:get/get.dart';
import 'package:gotdirt/app/controller/setting_controller.dart';

class SettingBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => SettingController(parser: Get.find()), fenix: true);
  }
}
