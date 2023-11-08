import 'package:get/get.dart';
class HomeIndexState {
  HomeIndexState() {
    ///Initialize variables
    ///
  }

  final List _tab = [
   "关注",
   "推荐",
   "附近",
  ].obs;
  get tab => _tab;


  final  _category = [
    "关注",
    "推荐",
    "附近","关注",
    "推荐",
    "附近","关注",
    "推荐",
    "附近","关注",
    "推荐",
    "附近",
    ""
  ].obs;

  get category => _category;



  final _tabIndex = 1.obs;

  set tabIndex(value) => _tabIndex.value = value;
  get tabIndex => _tabIndex.value;

}
