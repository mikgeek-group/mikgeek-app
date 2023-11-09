import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mkapp/components/mk_button.dart';
import 'package:mkapp/style/gaps.dart';
import 'package:mkapp/style/styles.dart';
import 'package:mkapp/style/theme.dart';

/// 自定义dialog的模板
class MkBaseDialog extends StatelessWidget {
  const MkBaseDialog(
      {super.key,
      this.title,
      this.onPressed,
      this.hiddenTitle = false,
      this.confirmText = '确定',
      this.cancelText = '取消',
      this.hideCancelButton = false,
      required this.child});

  final String? title, confirmText, cancelText;
  final VoidCallback? onPressed;
  final Widget child;
  final bool hiddenTitle, hideCancelButton;

  @override
  Widget build(BuildContext context) {
    final Widget dialogTitle = Visibility(
      visible: !hiddenTitle,
      child: Text(
        hiddenTitle ? '' : title ?? '',
        style: TextStyles.textBold16,
      ),
    );

    final Widget bottomButton = hideCancelButton
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: MkButton(
                text: confirmText!,
                textColor: Colors.white,
                onPressed: onPressed,
                radius: 6,
                minHeight: 36.h,
                backgroundColor: AppTheme.primaryColor,
              ))
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              MkButton(
                text: cancelText!,
                textColor: Colors.black,
                onPressed: () => {Get.back()},
                minWidth: 105.w,
                radius: 6,
                minHeight: 36.h,
                backgroundColor: Color(0xFFE3E8F2),
              ),
              MkButton(
                text: confirmText!,
                textColor: Colors.white,
                onPressed: onPressed,
                minWidth: 105.w,
                radius: 6,
                minHeight: 36.h,
                backgroundColor: AppTheme.primaryColor,
              )
            ],
          );

    final Widget content = Material(
      borderRadius: BorderRadius.circular(8.0),
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.iDefaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            dialogTitle,
            Gaps.vGap16,
            Flexible(child: child),
            Gaps.vGap16,
            bottomButton
          ],
        ),
      ),
    );

    final Widget body = MediaQuery.removeViewInsets(
      removeLeft: true,
      removeTop: true,
      removeRight: true,
      removeBottom: true,
      context: context,
      child: Center(
        child: SizedBox(
          width: 240.0.w,
          child: content,
        ),
      ),
    );

    /// Android 11添加了键盘弹出动画，这与我添加的过渡动画冲突（原先iOS、Android 没有相关过渡动画，相关问题跟踪：https://github.com/flutter/flutter/issues/19279）。
    /// 因为在Android 11上，viewInsets的值在键盘弹出过程中是变化的（以前只有开始结束的值）。
    /// 所以解决方法就是在Android 11及以上系统中使用Padding代替AnimatedPadding。

    // if (Device.getAndroidSdkInt() >= 30) {
    //   return Padding(
    //     padding: MediaQuery.of(context).viewInsets,
    //     child: body,
    //   );
    // } else {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 120),
      curve: Curves.easeInCubic, // easeOutQuad
      child: body,
    );
    // }
  }
}
