import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkapp/style/colors.dart';
import 'package:mkapp/style/dimens.dart';
import 'package:mkapp/style/gaps.dart';
import 'package:mkapp/style/theme.dart';

/// 默认字号16，白字蓝底，高度42
class MkButton extends StatelessWidget {
  const MkButton({
    super.key,
    this.text = '',
    this.fontSize = Dimens.font_sp14,
    this.textColor,
    this.disabledTextColor,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.minHeight = 42.0,
    this.minWidth = double.infinity,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.radius = 5.0,
    this.icon = null,
    this.side = BorderSide.none,
    required this.onPressed,
  });

  final Icon? icon;
  final String text;
  final double fontSize;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final double? minHeight;
  final double? minWidth;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final double radius;
  final BorderSide side;

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isDarkMode;
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          // 文字颜色
          foregroundColor: MaterialStateProperty.resolveWith(
            (states) {
              if (states.contains(MaterialState.disabled)) {
                return disabledTextColor ??
                    (isDark
                        ? Colours.dark_text_disabled
                        : Colours.text_disabled);
              }
              return textColor ?? (isDark ? Colours.dark_button_text : Colors.white);
              // return AppTheme.primaryColor;
            },
          ),
          // 背景颜色
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return disabledBackgroundColor ??
                  (isDark
                      ? Colours.dark_button_disabled
                      : Colours.button_disabled);
            }
            return backgroundColor ??
                (isDark ? Colours.dark_app_main :AppTheme.primaryColor);
          }),
          // 水波纹
          overlayColor: MaterialStateProperty.resolveWith((states) {
            return (textColor ??
                    (isDark ? Colours.dark_button_text : Colors.white))
                .withOpacity(0.12);
          }),
          // 按钮最小大小
          minimumSize: (minWidth == null || minHeight == null)
              ? null
              : MaterialStateProperty.all<Size>(Size(minWidth!, minHeight!)),
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          side: MaterialStateProperty.all<BorderSide>(side),
        ),
        child: _buildChild()
    );
  }

  _buildChild() {

    Widget textWidget = Text(
      text,
      style: TextStyle(fontSize: fontSize),
    );

    if(icon != null){
      return Row(
        children: [
          icon!,
          Gaps.hGap5,
          textWidget
        ],
      );
    }

    return textWidget;
  }
}
