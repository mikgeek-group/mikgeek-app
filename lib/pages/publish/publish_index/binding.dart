import 'package:get/get.dart';

import 'controller.dart';

class PublishIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PublishIndexController());
  }
}
