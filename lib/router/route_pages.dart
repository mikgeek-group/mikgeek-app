
import 'package:get/get.dart';
import 'package:mkapp/pages/main/binding.dart';
import 'package:mkapp/pages/main/view.dart';
import 'package:mkapp/pages/user/auth/login/binding.dart';
import 'package:mkapp/pages/user/auth/login/view.dart';

import 'route_names.dart';

class RoutePages {

  // 第一个界面
  static const INITIAL = RouteNames.main;

  static final List<GetPage> routes = [

    // 首页
    GetPage(
      name: RouteNames.main,
      binding: MainBinding(),
      page: () =>  MainPage(),
    ),

    GetPage(
      name: RouteNames.authLogin,
      binding: LoginBinding(),
      page: () =>  LoginPage(),
    ),
  ];
}
