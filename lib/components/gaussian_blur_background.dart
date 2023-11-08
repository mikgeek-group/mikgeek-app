import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GaussianBlurBackground extends StatelessWidget {
  const GaussianBlurBackground({super.key, required this.imgPath, required this.child});

  final String imgPath;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(imgPath),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 12),
        blendMode: BlendMode.srcOver,
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter, //渐变开始于上面的中间开始
                  end: Alignment.bottomCenter, //渐变结束于下面的中间
                  colors: [
                Color.fromARGB(180, 216, 216, 216),
                Color(0xFFFFFFFF),
              ])),
          child: child,
        ),
      ),
    );
  }
}
