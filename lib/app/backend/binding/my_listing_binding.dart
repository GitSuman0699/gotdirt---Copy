import 'package:get/get.dart';
import 'package:gotdirt/app/controller/my_listing_controller.dart';

class MyListingBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => MyListingController(parser: Get.find()), fenix: true);
  }
}
