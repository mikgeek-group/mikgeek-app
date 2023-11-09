import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mkapp/components/card_container.dart';
import 'package:mkapp/components/gaussian_blur_background.dart';
import 'package:mkapp/components/list_cell_item.dart';
import 'package:mkapp/pages/user/user_index/widgets/user_info.dart';
import 'package:mkapp/router/route_names.dart';
import 'package:mkapp/style/gaps.dart';
import 'package:mkapp/style/theme.dart';

import 'controller.dart';

class UserIndexPage extends StatefulWidget {
  @override
  State<UserIndexPage> createState() => _UserIndexPageState();
}

class _UserIndexPageState extends State<UserIndexPage> {
  final controller = Get.find<UserIndexController>();
  final state = Get.find<UserIndexController>().state;



  Widget _buildMenuList() {
    TextStyle _styleYellow = TextStyle(fontSize: 14, color: Colors.yellow[700]);
    return CardContainer(
      // border: BorderRadius.all(Radius.circular(0)),
      padding: EdgeInsets.symmetric(horizontal: AppTheme.iDefaultPadding),
      child: Column(
        children: [
          ListCellItem(
            value: '登录',
            press: () {
              Get.toNamed(RouteNames.authLogin);
            },
          ),   ListCellItem(
            value: '我的订单',
            press: () {},
          ),
          ListCellItem(
            value: '拥军入驻',
            press: () {},
            ext: Text('还没有入驻哟', style: _styleYellow),
          ),
          ListCellItem(
            value: '意见反馈',
            press: () {},
          ),
          ListCellItem(
            value: '系统设置',
            press: () {
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GaussianBlurBackground(
        imgPath: "assets/images/avatar.png",
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(onPressed: ()=>{}, icon: Icon(Icons.settings,size: 22,))
            ],
          ),
          body: Column(
            children: [
              UserInfo(avatarTap: ()=>{}, informationOnTap: ()=>{}),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("145",
                          style: TextStyle(
                              fontSize: 20
                          )),
                      Text("关注",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF8D93A6)
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Text("145",
                          style: TextStyle(
                              fontSize: 20
                          )),
                      Text("关注",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF8D93A6)
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Text("145",
                          style: TextStyle(
                              fontSize: 20
                          )),
                      Text("关注",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF8D93A6)
                          )),
                    ],
                  )
                ],
              ),

              Gaps.vGap32,

              _buildMenuList()

            ],
          ),
        ));
  }
}
