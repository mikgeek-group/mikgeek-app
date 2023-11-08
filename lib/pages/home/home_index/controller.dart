import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class HomeIndexController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final HomeIndexState state = HomeIndexState();

  TabController? tabController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    tabController = TabController(length: state.tab.length, vsync: this,initialIndex: state.tabIndex);

    tabController?.addListener(() {
      ///避免addListener调用2次
      if (tabController?.index == tabController?.animation?.value) {
        print("点击了下标为${tabController?.index}的tab");
      }
    });


  }
}
