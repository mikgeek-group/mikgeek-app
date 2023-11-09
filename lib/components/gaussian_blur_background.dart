import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GaussianBlurBackground extends StatelessWidget {
  // 高斯模糊背景组件
  const GaussianBlurBackground({super.key, required this.imgPath, required this.child});

  // 图片路径
  final String imgPath;
  // 子组件
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      // 宽度设置为屏幕宽度
      width: Get.width,
      // 布局装饰，设置背景图片
      decoration: BoxDecoration(
        image: DecorationImage(
          // 使用AssetImage加载图片
            image: AssetImage(imgPath),
            // 设置图片填充方式为适应宽度
            fit: BoxFit.fitWidth,
            // 图片对齐方式为顶部居中
            alignment: Alignment.topCenter),
      ),
      // 布景滤镜，应用高斯模糊效果
      child: BackdropFilter(
        // 设置滤镜为模糊效果，X轴标准差为20，Y轴标准差为12
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 12),
        // 混合模式为源覆盖
        blendMode: BlendMode.srcOver,
        // 子组件容器，设置背景渐变
        child: Container(
          // 布局装饰，设置背景渐变
          decoration: BoxDecoration(
              gradient: LinearGradient(
                // 渐变开始于上面的中间开始
                  begin: Alignment.topCenter,
                  // 渐变结束于下面的中间
                  end: Alignment.bottomCenter,
                  // 渐变颜色列表
                  colors: [
                    Color.fromARGB(180, 216, 216, 216),
                    Color(0xFFFFFFFF),
                  ])),
          // 显示子组件
          child: child,
        ),
      ),
    );
  }
}