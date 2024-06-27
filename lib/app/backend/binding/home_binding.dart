import 'package:get/get.dart';
import 'package:gotdirt/app/controller/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => HomeController(parser: Get.find()), fenix: true);
  }
}
