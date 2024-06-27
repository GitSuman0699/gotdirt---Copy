import 'package:get/get.dart';
import 'package:gotdirt/app/controller/post_controller.dart';

class PostBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => PostController(parser: Get.find()), fenix: true);
  }
}
