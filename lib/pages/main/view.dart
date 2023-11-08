import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkapp/components/mk_navigation.dart';
import 'package:mkapp/constant/svg_icon_assets.dart';

import 'controller.dart';

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller = Get.find<MainController>();
  final state = Get.find<MainController>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() =>Scaffold(
      body: controller.pageList[state.pageIndex],
      bottomNavigationBar:  BuildNavigation(
        currentIndex: state.pageIndex,
        items: [
          NavigationItemModel(
            label: "首页",
            icon: SvgIconAssets.home,
            activeIcon: SvgIconAssets.homeActive,
          ),
          NavigationItemModel(
            label: "社区",
            icon: SvgIconAssets.communication,
            activeIcon: SvgIconAssets.communicationActive,
          ),
          NavigationItemModel(
            icon: SvgIconAssets.circlePublish,
            activeIcon: SvgIconAssets.circlePublishActive,
          ),
          NavigationItemModel(
            label: "消息",
            icon: SvgIconAssets.communication,
            activeIcon: SvgIconAssets.communicationActive,
          ),
          NavigationItemModel(
            label: "我的",
            icon: SvgIconAssets.user,
            activeIcon: SvgIconAssets.userActive,
          ),
        ],
        onTap: controller.onIndexChanged, // 切换tab事件
      ),
    ));
  }

}