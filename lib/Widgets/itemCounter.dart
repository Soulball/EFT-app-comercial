//Barra de progreso para comisiones
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';
import 'customText.dart';

// ignore: must_be_immutable
class ItemCounter extends StatefulWidget {
  //Variables
  String item;
  int counter = 0;
  Color color = grayNeutral;

  //Constructor
  ItemCounter({this.item});

  @override
  _ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  Widget build(BuildContext context) {
    return Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
          Container(
              height: getVerticalPercent(context, 6),
              width: getHorizontalPercent(context, 50),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: getHorizontalPercent(context, 5)),
              color: widget.color,
              child: CustomText(
                  data: widget.item,
                  size: 20,
                  color: whiteNeutral,
                  weight: FontWeight.bold)),
          IconButton(
              splashRadius: 16,
              icon: Icon(Icons.arrow_left),
              iconSize: 32,
              onPressed: minus),
          CustomText(
              data: widget.counter.toString(),
              size: 24,
              color: grayDark,
              weight: FontWeight.bold),
          IconButton(splashRadius: 16,
              icon: Icon(Icons.arrow_right), iconSize: 32, onPressed: plus)
        ]));
  }

  //Metodos
  void plus() {
    setState(() {
      if (widget.counter < 9) widget.counter++;
      widget.color = blueLight;
    });
  }

  void minus() {
    setState(() {
      if (widget.counter > 0) widget.counter--;
      if (widget.counter == 0) widget.color = grayNeutral;
    });
  }
}
