import 'package:get/get.dart';
import 'package:gotdirt/app/controller/report_controller.dart';

class ReportBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => ReportController(parser: Get.find()), fenix: true);
  }
}
