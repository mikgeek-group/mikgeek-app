import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mkapp/components/card_transparent_container.dart';
import 'package:mkapp/components/load_image.dart';
import 'package:mkapp/pages/user/user_index/widgets/user_tag.dart';
import 'package:mkapp/style/font_icon.dart';
import 'package:mkapp/style/theme.dart';

class UserInfo extends StatelessWidget {
  final String? avatar;
  final Function avatarTap;
  final Function informationOnTap;

  const UserInfo(
      {Key? key,
      this.avatar,
      required this.avatarTap,
      required this.informationOnTap})
      : super(key: key);

  Widget _buildInfo(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => {avatarTap()},
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(60)),
                child: LoadImage("avatar", width: 60.w, height: 60.w),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppTheme.iDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "木木子",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(width: 5.w),
                        LoadImage('user/authentication', width: 18.w),
                        SizedBox(width: 5.w),
                        LoadImage('user/vip', width: 18.w)
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Text("美国帝国理工大学",
                        style:
                            TextStyle(color: Color(0xFF8D93A6), fontSize: 12)),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        UserTag(color: AppTheme.primaryColor, title: "登船200天"),
                        SizedBox(width: 5.h),
                        UserTag(color: Colors.orange, title: "登船200天"),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: IconButton(
                  onPressed: () => {}, icon: Icon(FontIcon.Adjust)),
            ),
            SizedBox(width: 10.w),
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: IconButton(
                  onPressed: () => {}, icon: Icon(FontIcon.Fabulous)),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CardTransparentContainer(
      // padding: const EdgeInsets.all(AppTheme.iDefaultPadding),
      child: Column(
        children: [
          _buildInfo(context),
        ],
      ),
    );
  }
}
