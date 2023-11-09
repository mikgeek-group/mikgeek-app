import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class FindIndexPage extends StatefulWidget {
  @override
  State<FindIndexPage> createState() => _FindIndexPageState();
}

class _FindIndexPageState extends State<FindIndexPage> {
  final controller = Get.find<FindIndexController>();
  final state = Get.find<FindIndexController>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发现'),
      ),
    );
  }

}