import 'package:get/get.dart';

import 'controller.dart';

class FindIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FindIndexController());
  }
}
