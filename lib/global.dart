import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mkapp/service/storage.dart';
import 'package:mkapp/store/config.dart';
import 'package:get/get.dart';
/// 全局静态初始化
class Global {
  /// 初始化
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    await Get.putAsync<StorageService>(() => StorageService().init());

    Get.put<ConfigStore>(ConfigStore());
  }

}
