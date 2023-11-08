import 'package:get/get.dart';

import 'controller.dart';

class CommunityIndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CommunityIndexController());
  }
}
