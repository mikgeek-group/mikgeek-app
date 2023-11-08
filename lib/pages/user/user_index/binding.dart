import 'package:get/get.dart';

import 'controller.dart';

class UserIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserIndexController());
  }
}
