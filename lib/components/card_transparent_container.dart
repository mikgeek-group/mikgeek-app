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

class CardTransparentContainer extends StatelessWidget {
  const CardTransparentContainer({
    Key? key,
    this.child,
    this.margin = _margin,
    this.padding = _padding,
    this.height,
  }) : super(key: key);

  final Widget? child;
  final double? height;
  final EdgeInsets margin, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: AppTheme.iBorderRadius,
      ),
      child: child,
    );
  }
}
