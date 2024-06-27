import 'package:get/get.dart';
import 'package:gotdirt/app/backend/parse/welcome_parse.dart';

class WelcomeController extends GetxController implements GetxService {
  final WelcomeParser parser;
  WelcomeController({required this.parser});
}
