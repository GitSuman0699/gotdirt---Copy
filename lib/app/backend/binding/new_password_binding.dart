import 'package:get/get.dart';
import 'package:gotdirt/app/controller/new_password_controller.dart';

class NewPasswordBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => NewPasswordController(parser: Get.find()), fenix: true);
  }
}
