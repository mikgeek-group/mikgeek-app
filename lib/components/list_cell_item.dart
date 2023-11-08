import 'package:flutter/material.dart';
import 'package:mkapp/style/font_icon.dart';
import 'package:mkapp/style/theme.dart';

const _defaultExt = Text('');
const _rightIcon = Icon(
  FontIcon.ArrowRight,
  size: 12,
);

const _textIcon = SizedBox.shrink();

class ListCellItem extends StatelessWidget {
  const ListCellItem({
    Key? key,
    this.height = AppTheme.iColumnMenuHeight,
    this.extOnTap,
    this.ext = _defaultExt,
    this.rightIcon = _rightIcon,
    this.textIcon = _textIcon,
    required this.value,
    required this.press,
  }) : super(key: key);

  final Widget ext;
  final String value;
  final VoidCallback press;
  final Widget rightIcon;
  final Widget textIcon;
  final double height;
  final Function? extOnTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: new Border(
            bottom: BorderSide(color: Colors.black.withOpacity(0.03), width: 1),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            textIcon,
            const SizedBox(width: 10),
            Text(
              value,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
            Expanded(
              flex: 1,
              child: GestureDetector(
                onTap: ()=>{
                  extOnTap!()
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ext,
                  ],
                ),
              ),
            ),
            SizedBox(width: AppTheme.iDefaultPadding / 2),
            rightIcon
          ],
        ),
      ),
    );
  }
}
