import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class PublishIndexPage extends StatefulWidget {
  @override
  State<PublishIndexPage> createState() => _PublishIndexPageState();
}

class _PublishIndexPageState extends State<PublishIndexPage> {
  final controller = Get.find<PublishIndexController>();
  final state = Get.find<PublishIndexController>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}