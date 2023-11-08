import 'package:get/get.dart';

import 'controller.dart';

class MessageIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageIndexController());
  }
}
