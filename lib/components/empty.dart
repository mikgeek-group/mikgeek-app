import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mkapp/components/mk_button.dart';
import 'package:mkapp/components/mk_load_image.dart';
import 'package:mkapp/style/gaps.dart';
import 'package:mkapp/style/styles.dart';
import 'package:mkapp/style/theme.dart';

import '../style/colors.dart';

class Empty extends StatelessWidget {
  const Empty({super.key, required this.text});

  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          MkLoadImage(
            "empty/no_message",
            width: 100.w,
          ),
          Gaps.vGap10,
          Center(
            child: Text(
              text,
              style: TextStyles.textGray14,
            ),
          ),
          Gaps.vGap10,
          MkButton(
            onPressed: () => {},
            text: "去看看",
            minWidth: 80.w,
            minHeight: 30.h,
            textColor: Colors.white,
            backgroundColor: AppTheme.primaryColor,
          ),
        ],
      ),
    );
  }
}
