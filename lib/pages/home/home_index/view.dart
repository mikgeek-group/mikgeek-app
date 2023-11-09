import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';
import 'package:mkapp/components/indicators/dot_indicator.dart';
import 'package:mkapp/components/indicators/material_Indicator.dart';
import 'package:mkapp/components/mk_load_image.dart';
import 'package:mkapp/pages/home/home_index/state.dart';
import 'package:mkapp/style/font_icon.dart';
import 'package:mkapp/style/theme.dart';

import 'controller.dart';

class HomeIndexPage extends StatefulWidget {
  @override
  State<HomeIndexPage> createState() => _HomeIndexPageState();
}

class _HomeIndexPageState extends State<HomeIndexPage> {
  final controller = Get.find<HomeIndexController>();
  final HomeIndexState state = Get.find<HomeIndexController>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => {},
              icon: Icon(
                FontIcon.Search,
                size: 20,
              ))
        ],
        title: TabBar(
          controller: controller.tabController,
          indicator: MaterialIndicator(),
          isScrollable: true,
          tabs: state.tab.map<Widget>((e) => Tab(text: e)).toList(),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        children: [
          Text("1"),
          _buildRecommand(),
          Text("3"),
        ],
      ),
    );
  }

  Widget _buildRecommand() {
    return Padding(
        padding: EdgeInsets.all(AppTheme.iDefaultPadding),
        child: Column(
          children: [
            Container(
                height: 120.h,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return MkLoadImage("https://api.likepoems.com/img/pc/",
                        fit: BoxFit.fill);
                  },
                  autoplay: true,
                  itemCount: 3,
                  pagination:
                      new SwiperPagination(builder: SwiperPagination.dots),
                  // control: new SwiperControl(),
                )),
            SizedBox(
              height: AppTheme.iDefaultPadding,
            ),
            Stack(
              children: [
                DefaultTabController(
                    length: state.category.length,
                    child: TabBar(
                      indicator: DotIndicator(),
                      isScrollable: true,
                      tabs: state.category
                          .map<Widget>((e) => Tab(text: e))
                          .toList(),
                    )),
                Positioned(
                  right: 0,
                  child: Container(
                    height: 50.h,
                    width: 30.w,
                    color: Colors.white,
                    child: Icon(FontIcon.Column3),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: AppTheme.iDefaultPadding / 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "本科研究生如何通过规划时间斩获大厂Offer",
                    maxLines: 2,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: AppTheme.iDefaultPadding),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("王若瑄Jimmy",
                          style: TextStyle(color: Color(0xFF8D93A6))),
                      Text(
                        "1.4万赞",
                        style: TextStyle(color: Color(0xFF8D93A6)),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
