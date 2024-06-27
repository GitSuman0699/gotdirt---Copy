import 'package:get/get.dart';
import 'package:gotdirt/app/controller/verify_otp_contoller.dart';

class VerifyOtpBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => VerifyOtpController(parser: Get.find()), fenix: true);
  }
}
