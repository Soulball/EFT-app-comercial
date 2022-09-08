// @dart=2.9

import 'package:flutter/material.dart';

import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';

// ignore: must_be_immutable
class CustomCheckList extends StatefulWidget {
  Color color;
  bool select;
  bool select2;
  Widget text;
  CustomCheckList({
    Key key,
    this.select,
    this.select2,
    this.text,
    this.color,
  }) : super(key: key);

  @override
  _CustomCheckListState createState() => _CustomCheckListState();
}

class _CustomCheckListState extends State<CustomCheckList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalPercent(context, 10),
      width: getHorizontalPercent(context, 20),
      alignment: Alignment.bottomLeft,
      color: widget.color,
      child: CheckboxListTile(
        activeColor: Colors.grey,
        value: widget.select2,
        title: widget.text,
        tristate: true,
        onChanged: (select) {
          setState(() {
            if (widget.select2 == true) {
              widget.select2 = false;
            } else {
              widget.select2 = select;
            }
          });
        },
      ),
    );
  }
}
