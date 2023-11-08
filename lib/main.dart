import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mkapp/components/double_tap_back_exit_app.dart';
import 'package:mkapp/constant/storage_constant.dart';
import 'package:mkapp/global.dart';
import 'package:mkapp/service/storage.dart';
import 'package:mkapp/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'router/route_pages.dart';

Future<void> main() async {
  await Global.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  ThemeData getThemeData() {
    bool isDark = StorageService.to.getBool(THEME_IS_DARK);

    return isDark ? AppTheme.dark : AppTheme.light;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return DoubleTapBackExitApp(
              child: GetMaterialApp(
                  // 转场动画
                  defaultTransition: GetPlatform.isIOS
                      ? Transition.native
                      : Transition.rightToLeft,
                  title: '米柯极客',
                  debugShowCheckedModeBanner: false,
                  initialRoute: RoutePages.INITIAL,
                  getPages: RoutePages.routes,
                  theme: getThemeData(),
                  builder: (context, child) {
                    var easyload = EasyLoading.init();
                    child = easyload(context, child);
                    return child;
                  })
          );
        });
  }
}
