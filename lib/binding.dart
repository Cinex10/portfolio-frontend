import 'package:get/get.dart';
import 'package:portfolio/controllers/controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PortfolioController());
  }
}
