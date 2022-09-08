//Barra de progreso para comisiones

// @dart=2.9

import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';
import 'customText.dart';

// ignore: must_be_immutable
class ProgressBar extends StatefulWidget {
  //Variables
  int actualAmount;
  int maxAmount;

  //Constructor
  ProgressBar({this.actualAmount, this.maxAmount});

  @override
  _ProgressBarState createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  Widget build(BuildContext context) {
    double barLength = getHorizontalPercent(context, 40);
    return Stack(alignment: Alignment.center, children: [
      Container(
          height: getVerticalPercent(context, 5),
          width: barLength,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: grayDark,
              borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(getVerticalPercent(context, 5)))),
          child: Container(
              width: (widget.actualAmount >= widget.maxAmount)
                  ? barLength
                  : barLength / widget.maxAmount * widget.actualAmount,
              decoration: BoxDecoration(
                  color: red,
                  borderRadius: BorderRadius.horizontal(
                      right:
                          Radius.circular(getVerticalPercent(context, 5)))))),
      CustomText(
          data: widget.actualAmount.toString() +
              " / " +
              widget.maxAmount.toString(),
          size: 14,
          color: whiteLight,
          weight: FontWeight.bold)
    ]);
  }
}
