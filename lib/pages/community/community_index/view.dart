import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class CommunityIndexPage extends StatefulWidget {
  @override
  State<CommunityIndexPage> createState() => _CommunityIndexPageState();
}

class _CommunityIndexPageState extends State<CommunityIndexPage> {
  final controller = Get.find<CommunityIndexController>();
  final state = Get.find<CommunityIndexController>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}