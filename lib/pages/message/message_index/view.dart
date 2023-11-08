import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class MessageIndexPage extends StatefulWidget {
  @override
  State<MessageIndexPage> createState() => _MessageIndexPageState();
}

class _MessageIndexPageState extends State<MessageIndexPage> {
  final controller = Get.find<MessageIndexController>();
  final state = Get.find<MessageIndexController>().state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }


}