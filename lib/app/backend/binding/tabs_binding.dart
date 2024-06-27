import 'package:get/get.dart';
import 'package:gotdirt/app/controller/home_controller.dart';
import 'package:gotdirt/app/controller/post_controller.dart';
import 'package:gotdirt/app/controller/setting_controller.dart';
import 'package:gotdirt/app/controller/tabs_controller.dart';

class TabsBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => BottomTabsController(parser: Get.find()), fenix: true);
    Get.lazyPut(() => HomeController(parser: Get.find()), fenix: true);
    Get.lazyPut(() => SettingController(parser: Get.find()), fenix: true);
    Get.lazyPut(() => PostController(parser: Get.find()), fenix: true);
  }
}
