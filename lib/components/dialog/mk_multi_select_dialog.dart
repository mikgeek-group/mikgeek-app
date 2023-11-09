import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:mkapp/components/dialog/mk_base_dialog.dart';
import 'package:mkapp/components/mk_load_image.dart';
import 'package:mkapp/style/gaps.dart';

class MkMultiSelectDialog extends StatefulWidget {
  const MkMultiSelectDialog({
    super.key,
    this.selected,
    required this.onConfirm,
    required this.list,
    required this.title,
  });

  final String title;
  final List<int>? selected;
  final List<String> list;
  final Function(List<int>) onConfirm;

  @override
  _MkMultiSelectDialog createState() => _MkMultiSelectDialog();
}

class _MkMultiSelectDialog extends State<MkMultiSelectDialog> {
  late List<int> _selectValue =widget.selected?? [];

  Widget _buildItem(int index) {
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        child: SizedBox(
          height: 42.0,
          child: Row(
            children: <Widget>[
              Gaps.hGap16,
              Expanded(
                child: Text(widget.list[index]),
              ),
              MkLoadAssetImage(
                  _selectValue.contains(index) ? 'selected' : 'unselect',
                  width: 16.0,
                  height: 16.0),
              Gaps.hGap16,
            ],
          ),
        ),
        onTap: () {
         if(mounted){
           setState(() {
             if (_selectValue.contains(index)) {
               _selectValue.remove(index);
             } else {
               _selectValue.add(index);
             }
             print(_selectValue);
           });
         }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MkBaseDialog(
      title: widget.title,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.list.length, (i) => _buildItem(i))),
      onPressed: () {
        Get.back();
        widget.onConfirm(_selectValue);
      },
    );
  }
}
