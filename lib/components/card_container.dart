import 'package:flutter/material.dart';
import 'package:mkapp/style/theme.dart';

const EdgeInsets _margin = EdgeInsets.only(
  left: AppTheme.iDefaultPadding,
  right: AppTheme.iDefaultPadding,
  bottom: AppTheme.iDefaultPadding,
);

const EdgeInsets _padding = EdgeInsets.symmetric(
  vertical: AppTheme.iDefaultPadding,
);

/**
 * 卡片容器
 *
 * 用于包裹卡片内容的容器，提供了一些样式属性
 */
class CardContainer extends StatelessWidget {
  const CardContainer({
    Key? key,
    this.child, // 子组件
    this.margin = _margin, // 边距
    this.padding = _padding, // 内边距
    this.height, // 容器高度
    this.isTransparent = false, // 是否透明
    this.border = AppTheme.iBorderRadius, // 是否透明
  }) : super(key: key);

  final Widget? child; // 子组件
  final double? height; // 容器高度
  final EdgeInsets margin, padding; // 边距和内边距
  final bool isTransparent; // 是否透明
  final BorderRadiusGeometry border;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin, // 边距
      padding: padding, // 内边距
      height: height, // 容器高度
      decoration: BoxDecoration(
        color: isTransparent ? Colors.transparent : Theme.of(context).cardColor, // 容器背景颜色
        borderRadius: border, // 容器圆角半径
      ),
      child: child, // 子组件
    );
  }
}
