import 'package:flutter/material.dart';


// 展示弹性对话框
Future<T?> showElasticDialog<T>({
  required BuildContext context, // 建立上下文
  bool barrierDismissible = true, // 是否可以点击屏障关闭对话框
  required WidgetBuilder builder, // 建立小部件
}) {
  return showGeneralDialog(
    context: context, // 上下文
    pageBuilder: (BuildContext buildContext, Animation<double> animation, Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder); // 建立小部件
      return SafeArea(
        child: pageChild, // 小部件的子组件
      );
    },
    barrierDismissible: barrierDismissible, // 置屏障可否关闭
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel, // 置屏障关闭的标签
    barrierColor: Colors.black54, // 罩色
    transitionDuration: const Duration(milliseconds: 550), // 过渡动画持续时间
    transitionBuilder: _buildDialogTransitions, // 过渡动画构建器
  );
}


Widget _buildDialogTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
  return FadeTransition(
    opacity: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: SlideTransition(
      position: Tween<Offset>(
          begin: const Offset(0.0, 0.3),
          end: Offset.zero
      ).animate(CurvedAnimation(
        parent: animation,
        curve: const ElasticOutCurve(0.85),
        reverseCurve: Curves.easeOutBack,
      )),
      child: child,
    ),
  );
}