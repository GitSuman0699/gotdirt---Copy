import 'package:get/get.dart';
import 'package:gotdirt/app/controller/accessibility_controller.dart';

class AccessibilityBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => AccessibilityController(parser: Get.find()), fenix: true);
  }
}
