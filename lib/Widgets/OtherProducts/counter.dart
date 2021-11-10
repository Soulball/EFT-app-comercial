import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Reports/report.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/customchecklist.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCounter extends StatefulWidget {
  String item;
  int count = 0;
  Color color;
  CustomCounter({Key key, this.item}) : super(key: key);

  @override
  _CustomCounterState createState() => _CustomCounterState();
}

class _CustomCounterState extends State<CustomCounter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            height: getVerticalPercent(context, 6),
            width: getHorizontalPercent(context, 40),
            alignment: Alignment.centerLeft,
            color: widget.color,
            child: CustomText(
                data: widget.item,
                size: 20,
                color: Colors.amber,
                weight: FontWeight.bold),
          ),
          IconButton(
            splashRadius: 16,
            icon: Icon(Icons.arrow_left_sharp),
            iconSize: 32,
            onPressed: down,
          ),
          CustomText(
            data: widget.count.toString(),
            size: 24,
            color: grayDark,
            weight: FontWeight.bold,
          ),
          IconButton(
            splashRadius: 16,
            icon: Icon(Icons.arrow_right_sharp),
            iconSize: 32,
            onPressed: up,
          ),
        ],
      ),
    );
  }

  void down() {
    setState(() {
      if (widget.count > 0) widget.count--;
      if (widget.count == 0) widget.color = grayNeutral;
    });
  }

  void up() {
    setState(() {
      if (widget.count < 9) widget.count++;
      widget.color = blueLight;
    });
  }
}
