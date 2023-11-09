import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mkapp/components/border/dotted_border.dart';
import 'package:mkapp/components/empty.dart';
import 'package:mkapp/components/indicators/material_Indicator.dart';
import 'package:mkapp/components/mk_button.dart';
import 'package:mkapp/components/mk_load_image.dart';
import 'package:mkapp/components/mk_search_field.dart';
import 'package:mkapp/style/colors.dart';
import 'package:mkapp/style/dimens.dart';
import 'package:mkapp/style/font_icon.dart';
import 'package:mkapp/style/gaps.dart';
import 'package:mkapp/style/styles.dart';
import 'package:mkapp/style/theme.dart';

import 'controller.dart';

class CommunityIndexPage extends StatefulWidget {
  @override
  State<CommunityIndexPage> createState() => _CommunityIndexPageState();
}

class _CommunityIndexPageState extends State<CommunityIndexPage> {
  final controller = Get.find<CommunityIndexController>();
  final state = Get.find<CommunityIndexController>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: TabBar(
          controller: controller.tabController,
          indicator: MaterialIndicator(paintingStyle: PaintingStyle.fill),
          isScrollable: true,
          tabs: state.tab.map<Widget>((e) => Tab(text: e)).toList(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppTheme.iDefaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MkButton(
                  fontSize: Dimens.font_sp12,
                  minWidth: 50.0,
                  minHeight: 30.0,
                  icon: Icon(FontIcon.Code),
                  text: '创建社区',
                  side: BorderSide(color: AppTheme.primaryColor),
                  radius: 50.0,
                  padding: EdgeInsets.all(10),
                  textColor: AppTheme.primaryColor,
                  backgroundColor: Colors.transparent,
                  onPressed: () {
                    controller.createCommunity();
                  },
                ),
              ],
            ),
          )
        ],
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          _buildMyCommunity(),
          _buildSquare()
        ],
      ),
    );
  }

  _buildMyCommunity() {
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(AppTheme.iDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MkSearchField(),
              Gaps.vGap16,
              Text(
                "我创建的",
                style: TextStyles.textBold16,
              ),
              Gaps.vGap12,
              DottedBorder(
                dashPattern: [4, 4],
                strokeWidth: 1,
                radius: Radius.circular(10),
                color: Colours.text_gray,
                child: Container(
                  height: 80,
                  width: 80,
                  child: Center(
                    child: Icon(FontIcon.Add, color: Colours.text_gray),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: AppTheme.iDefaultPadding /2),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: MkLoadImage(
                            'avatar',
                            width: 80,
                            height: 80,
                          )),
                      Gaps.vGap8,
                      Text(
                        "乔治城大学交友群",
                        style: TextStyles.textSize12,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  )),
              Gaps.vGap16,
              Text(
                "我加入的",
                style: TextStyles.textBold16,
              ),
              Gaps.vGap12,
              Empty(text: "您还没有加入社区哦~"),
              Gaps.vGap16,
              Text(
                "可能认识的人",
                style: TextStyles.textBold16,
              ),
              Gaps.vGap12,
              Container(
                width: Get.width,
                height: 190,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Stack(
                      children: [
                        Container(
                          width: 110.w,
                          height: 190,
                          margin: EdgeInsets.all(AppTheme.iDefaultPadding / 2),
                          padding: EdgeInsets.only(
                              top: AppTheme.iDefaultPadding * 1.4,
                              bottom: AppTheme.iDefaultPadding),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.w)),
                              boxShadow: AppTheme.iShadow),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60)),
                                child: MkLoadImage("avatar",
                                    width: 50, height: 50),
                              ),
                              Gaps.vGap4,
                              Text("王子星", style: TextStyles.textBold16),
                              Gaps.vGap4,
                              Text("美国帝国理",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyles.textGray12),
                              Gaps.vGap8,

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  MkButton(
                                    fontSize: Dimens.font_sp12,
                                    minWidth: 40.w,
                                    minHeight: 24.h,
                                    icon: Icon(FontIcon.Add,size: 12,),
                                    text: '加入',
                                    radius: 50.0,
                                    padding: EdgeInsets.all(10),
                                    backgroundColor: AppTheme.primaryColor,
                                    onPressed: () {
                                      controller.createCommunity();
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            right: 6.w,
                            top: 6.h,
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: AppTheme.iDefaultPadding / 4,
                                  bottom: AppTheme.iDefaultPadding / 4,
                                  left: AppTheme.iDefaultPadding / 2,
                                  right: AppTheme.iDefaultPadding / 2),
                              decoration: BoxDecoration(
                                color: Colors.orange.withOpacity(0.1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.w)),
                              ),
                              child: Text(
                                "匹配度93%",
                                style: TextStyle(
                                    color: Colors.orange,
                                    fontSize: Dimens.font_sp10),
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  _buildSquare() {

    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.all(AppTheme.iDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MkSearchField(),
              Gaps.vGap16,


              Container(
                padding: EdgeInsets.all(AppTheme.iDefaultPadding),
                child: Column(
                  children: [
                    
                    
                  ],
                ),
              )

            ],
          )),
    );
  }
}
