import 'package:get/get.dart';
import 'package:gotdirt/app/controller/add_seller_listing_controller.dart';

class AddSellerListingBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => AddSellerListingController(parser: Get.find()),
        fenix: true);
  }
}
