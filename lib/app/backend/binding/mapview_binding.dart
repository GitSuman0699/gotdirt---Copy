import 'package:get/get.dart';
import 'package:gotdirt/app/controller/mapview_controller.dart';

class MapViewBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => MapViewController(parser: Get.find()), fenix: true);
  }
}
