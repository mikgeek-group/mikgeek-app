import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkapp/style/theme.dart';

class UserTag extends StatelessWidget {
  const UserTag({super.key, required this.color, required this.title});

  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3.h),
      decoration: BoxDecoration(
        border: Border.all(
            width: 1.0,
            color: color.withAlpha(100)
        ),
        borderRadius: AppTheme.iBorderRadius,
      ),
      child: Text("登船200天",
          style: TextStyle(
              fontSize: 10,
              color: color
          )),
    );
  }
}
