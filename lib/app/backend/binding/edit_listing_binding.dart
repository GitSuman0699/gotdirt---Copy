import 'package:get/get.dart';
import 'package:gotdirt/app/controller/edit_listing_controller.dart';

class EditListingBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => EditListingController(parser: Get.find()), fenix: true);
  }
}
