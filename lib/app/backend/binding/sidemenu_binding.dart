import 'package:get/get.dart';
import 'package:gotdirt/app/controller/sidemenu_controller.dart';

class SideMenuBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => SideMenuController(parser: Get.find()), fenix: true);
  }
}
