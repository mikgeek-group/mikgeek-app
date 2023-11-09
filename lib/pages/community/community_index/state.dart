import 'package:get/get.dart';
class CommunityIndexState {
  CommunityIndexState() {
    ///Initialize variables
  }

  final List _tab = [
    "我的社区",
    "广场",
  ].obs;
  get tab => _tab;

  final _tabIndex = 0.obs;

  set tabIndex(value) => _tabIndex.value = value;
  get tabIndex => _tabIndex.value;
}
