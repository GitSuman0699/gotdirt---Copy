import 'package:get/get.dart';
import 'package:gotdirt/app/controller/edit_account_controller.dart';

class EditAccountBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => EditAccountController(parser: Get.find()), fenix: true);
  }
}
