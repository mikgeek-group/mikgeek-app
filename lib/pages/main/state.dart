import 'package:get/get.dart';
class MainState {
  MainState() {
    ///Initialize variables
  }



  final _pageIndex = 0.obs;

  set pageIndex(value) => _pageIndex.value = value;

  get pageIndex => _pageIndex.value;
}
