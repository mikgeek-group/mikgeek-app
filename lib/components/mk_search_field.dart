import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkapp/style/colors.dart';
import 'package:mkapp/style/font_icon.dart';
import 'package:mkapp/style/theme.dart';

class MkSearchField extends StatelessWidget {
  const MkSearchField({
    Key? key,
    this.placeholder = '输入搜索内容',
    this.btnText = '搜索',
    this.haveButton = false,
    this.haveGap = true,
  }) : super(key: key);

  final String placeholder, btnText;
  final bool haveButton, haveGap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right:  5 , left: 10 ),
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xFFF6F8FA),
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            FontIcon.Search,
            size: 20,
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                onChanged: (value) {},

                decoration: InputDecoration(
                  hintText: placeholder,
                  isCollapsed: true,
                  hintStyle: TextStyle(
                      color: Theme.of(context).unselectedWidgetColor,
                      fontSize: 14),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          haveButton
              ? ElevatedButton(
                  onPressed: () {},
                  child: Text(btnText),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(1)),
                    textStyle: MaterialStateProperty.all(TextStyle(
                      fontSize: 14,
                    )),
                    backgroundColor:
                        MaterialStateProperty.all(AppTheme.primaryColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                    ),
                  ),
                )
              : Text(''),
        ],
      ),
    );
  }
}
