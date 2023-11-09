import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkapp/components/indicators/dot_indicator.dart';
import 'package:mkapp/components/indicators/material_Indicator.dart';
import 'package:mkapp/style/colors.dart';
import 'package:mkapp/style/styles.dart';

class AppTheme {
  static const horizontalMargin = 16.0;
  static const radius = 10.0;

  // 主色
  static const primaryColor = Color(0xFF5F2AFF);

  // 卡片黑色背景
  static const Color cardDarkBackground = Color(0xFF373A3B);

  // 系统级padding
  static const double iDefaultPadding = 16.0;

  // 系统级圆角
  static const BorderRadiusGeometry iBorderRadius =
  BorderRadius.all(Radius.circular(10));


  static const List<BoxShadow>? iShadow = [
    BoxShadow(
        color: Colors.black12,
        offset: Offset(1.0, 1.0), //阴影xy轴偏移量
        blurRadius: 8.0, //阴影模糊程度
        spreadRadius: 1.0 //阴影扩散程度
    )
  ];

  // 单个列按钮高度
  static const double iColumnMenuHeight = 46.0;

  static ThemeData light = ThemeData(
    // 风格主题
    brightness: Brightness.light,

    // 页面背景色
    // scaffoldBackgroundColor: const Color(0xFFF4F4F4),
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    // splashColor: Colors.transparent,
    // highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,

    primaryColor: primaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: const Color(0xFF5C78FF),
    ),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: Get.isDarkMode ? TextStyles.textHint14 : TextStyles
          .textDarkGray14,
    ),
    textSelectionTheme: TextSelectionThemeData(
        selectionColor: AppTheme.primaryColor.withAlpha(70),
        selectionHandleColor: AppTheme.primaryColor,
        cursorColor: AppTheme.primaryColor
    ),
    appBarTheme: const AppBarTheme(
      toolbarHeight: 42,
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.black, size: 18.0),
      titleTextStyle: TextStyle(
        color: Color(0xFF333333),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: TextStyle(
        color: Color(0xFF333333),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFFFFFFF),
      unselectedLabelStyle: TextStyle(fontSize: 10),
      selectedLabelStyle: TextStyle(fontSize: 10, color: primaryColor),
      unselectedItemColor: Color(0xffA2A5B9),
      selectedItemColor: primaryColor,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: primaryColor,
      labelColor: Colors.black,
      unselectedLabelColor: Color(0xFFA2A5B9),
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
      unselectedLabelStyle: TextStyle(
          fontSize: 14, fontWeight: FontWeight.normal),
    ),
  );

  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    // 页面背景色
    splashColor: Colors.transparent,
    primaryColor: primaryColor,

    cardColor: cardDarkBackground,

    appBarTheme: const AppBarTheme(
      toolbarHeight: 42,
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.black54,
      iconTheme: IconThemeData(size: 18.0),
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedLabelStyle: TextStyle(fontSize: 12),
      selectedLabelStyle: TextStyle(fontSize: 12, color: Colors.white),
      unselectedItemColor: Color(0xffA2A5B9),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
    ),
  );
}
