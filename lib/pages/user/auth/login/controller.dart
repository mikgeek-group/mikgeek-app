import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'state.dart';

class LoginController extends GetxController {
  final LoginState state = LoginState();


  //定义一个controller
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode nodeText1 = FocusNode();
  final FocusNode nodeText2 = FocusNode();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      /// 显示状态栏和导航栏
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    });
  }


  void verify() {
    final String name = nameController.text;
    final String password = passwordController.text;
    bool clickable = true;
    if (name.isEmpty || name.length < 11) {
      clickable = false;
    }
    if (password.isEmpty || password.length < 6) {
      clickable = false;
    }

    print(11);

    /// 状态不一样再刷新，避免不必要的setState
    if (clickable != state.clickable) {
      state.clickable = clickable;
    }
  }

  void login(){

  }
}
