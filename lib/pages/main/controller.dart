import 'package:get/get.dart';
import 'package:mkapp/pages/community/community_index/view.dart';
import 'package:mkapp/pages/home/home_index/view.dart';
import 'package:mkapp/pages/message/message_index/view.dart';
import 'package:mkapp/pages/publish/publish_index/view.dart';
import 'package:mkapp/pages/user/user_index/view.dart';

import 'state.dart';

class MainController extends GetxController {
  final MainState state = MainState();



  void onIndexChanged(int idx) {
    state.pageIndex = idx;
  }

  List pageList = [
    HomeIndexPage(),
    CommunityIndexPage(),
    PublishIndexPage(),
    MessageIndexPage(),
    UserIndexPage()
  ];
}
