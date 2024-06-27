import 'package:get/get.dart';
import 'package:gotdirt/app/controller/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => SplashController(parser: Get.find()), fenix: true);
  }
}
