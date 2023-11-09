import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkapp/components/dialog/mk_base_dialog.dart';
import 'package:mkapp/components/dialog/mk_multi_select_dialog.dart';
import 'package:mkapp/utils/util_dialog.dart';

import 'state.dart';

class CommunityIndexController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final CommunityIndexState state = CommunityIndexState();

  TabController? tabController;

  TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    tabController = TabController(
        length: state.tab.length, vsync: this, initialIndex: state.tabIndex);

    tabController?.addListener(() {
      ///避免addListener调用2次
      if (tabController?.index == tabController?.animation?.value) {
        print("点击了下标为${tabController?.index}的tab");
      }
    });
  }

  void createCommunity() {
    showElasticDialog<void>(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return MkMultiSelectDialog(
          title: '社区性质',
          selected: [1, 2],
          onConfirm: (List<int> list) => {print(list)},
          list: <String>['线上支付', '对公转账', '货到付款'],
        );
      },
    );
  }
}
