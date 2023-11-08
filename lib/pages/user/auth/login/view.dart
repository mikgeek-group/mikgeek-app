import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mkapp/components/load_image.dart';
import 'package:mkapp/components/mk_button.dart';
import 'package:mkapp/components/mk_scroll_view.dart';
import 'package:mkapp/components/mk_text_field.dart';
import 'package:mkapp/style/font_icon.dart';
import 'package:mkapp/style/gaps.dart';
import 'package:mkapp/style/styles.dart';
import 'package:mkapp/style/theme.dart';
import 'package:mkapp/utils/change_notifier_manage.dart';
import 'package:mkapp/utils/other_utils.dart';

import '../../../../style/colors.dart';
import 'controller.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with ChangeNotifierMixin<LoginPage> {
  final controller = Get.find<LoginController>();
  final state = Get.find<LoginController>().state;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/user/login_bg.png"),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  top: AppTheme.iDefaultPadding / 1.4,
                  right: AppTheme.iDefaultPadding),
              child: Text("密码登录"),
            )
          ],
        ),
        body: MkScrollView(
          keyboardConfig: Utils.getKeyboardActionsConfig(
              context, <FocusNode>[controller.nodeText1, controller.nodeText2]),
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
          children: _buildBody,
          bottomButton: Column(
            children: [
              Center(
                  child: Text(
                "未注册手机号登录后将自动生成账号",
                style: TextStyle(color: Colours.text_gray),
              )),
              Center(
                  child: Text(
                "且代表您已阅读并同意《用户协议》和 《隐私政策》",
                style: TextStyle(color: Colours.text_gray),
              )),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> get _buildBody => <Widget>[
        Gaps.vGap50,
        Text(
          "手机号登录",
          textAlign: TextAlign.start,
          style: TextStyles.textBold24,
        ),
        Gaps.vGap32,
        MkTextField(
          key: const Key('phone'),
          focusNode: controller.nodeText1,
          controller: controller.nameController,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          hintText: "请输入手机号",
        ),
        Gaps.vGap8,
        MkTextField(
          key: const Key('password'),
          keyName: 'password',
          focusNode: controller.nodeText2,
          isInputPwd: true,
          controller: controller.passwordController,
          keyboardType: TextInputType.visiblePassword,
          hintText: "请输入密码",
        ),
        Gaps.vGap24,
        Obx(() => MkButton(
              key: const Key('login'),
              onPressed: state.clickable ? controller.login : null,
              text: "登录",
            )),
        Container(
          height: 40.0,
          alignment: Alignment.centerRight,
          child: GestureDetector(
            child: Text(
              "忘记密码",
              key: const Key('forgotPassword'),
              style: Theme.of(context).textTheme.titleSmall,
            ),
            onTap: () => {},
          ),
        ),
        Gaps.vGap16,
        Container(
            alignment: Alignment.center,
            child: GestureDetector(
              child: Text(
                "还没有账户？ 去注册",
                key: const Key('noAccountRegister'),
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onTap: () => {},
            )),
        Gaps.vGap50,
        Center(
          child: Text("第三方登录"),
        ),
        Gaps.vGap24,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: IconButton(onPressed: () => {}, icon: Icon(Icons.wechat)),
            ),
            Gaps.hGap16,
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child:
                  IconButton(onPressed: () => {}, icon: Icon(FontIcon.Browse)),
            ),
            Gaps.hGap16,
            Container(
              width: 36.w,
              height: 36.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: IconButton(onPressed: () => {}, icon: Icon(Icons.apple)),
            ),
          ],
        )
      ];

  @override
  void dispose() {
    Get.delete<LoginController>();
    super.dispose();
  }

  @override
  Map<ChangeNotifier, List<VoidCallback>?>? changeNotifier() {
    final List<VoidCallback> callbacks = <VoidCallback>[controller.verify];
    return <ChangeNotifier, List<VoidCallback>?>{
      controller.nameController: callbacks,
      controller.passwordController: callbacks,
      controller.nodeText1: null,
      controller.nodeText2: null,
    };
  }
}
