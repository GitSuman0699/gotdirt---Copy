import 'package:get/get.dart';
import 'package:gotdirt/app/controller/signup_controller.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => SignUpController(parser: Get.find()), fenix: true);
  }
}
