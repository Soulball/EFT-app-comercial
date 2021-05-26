//Barra de progreso para comisiones
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
    double barLength = getHorizontalPercent(context, 70);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.looks_one),
              color: Colors.red,
              iconSize: getHorizontalPercent(context, 10),
              onPressed: minus),
          Stack(alignment: Alignment.center, children: [
            Container(
                height: getVerticalPercent(context, 5),
                width: barLength,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: grayDark,
                    borderRadius: BorderRadius.circular(
                        getVerticalPercent(context, 2.5))),
                child: Container(
                    width: barLength / widget.maxAmount * widget.actualAmount,
                    decoration: BoxDecoration(
                        color: red,
                        borderRadius: BorderRadius.circular(
                            getVerticalPercent(context, 2.5))))),
            CustomText(
                data: widget.actualAmount.toString() +
                    " / " +
                    widget.maxAmount.toString(),
                size: 14,
                color: whiteLight,
                weight: FontWeight.bold)
          ]),
          IconButton(
              icon: Icon(Icons.looks_one),
              color: Colors.red,
              iconSize: getHorizontalPercent(context, 10),
              onPressed: plus)
        ]);
  }

  //Metodos
  void plus() {
    setState(() {
      if (widget.actualAmount < widget.maxAmount) widget.actualAmount++;
    });
  }

  void minus() {
    setState(() {
      if (widget.actualAmount > 0) widget.actualAmount--;
    });
  }
}
