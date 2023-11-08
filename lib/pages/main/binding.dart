import 'package:get/get.dart';
import 'package:mkapp/pages/community/community_index/controller.dart';
import 'package:mkapp/pages/home/home_index/controller.dart';
import 'package:mkapp/pages/message/message_index/controller.dart';
import 'package:mkapp/pages/publish/publish_index/controller.dart';
import 'package:mkapp/pages/user/user_index/controller.dart';

import 'controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainController());

    Get.lazyPut(() => HomeIndexController());
    Get.lazyPut(() => CommunityIndexController());
    Get.lazyPut(() => PublishIndexController());
    Get.lazyPut(() => MessageIndexController());
    Get.lazyPut(() => UserIndexController());
  }
}
