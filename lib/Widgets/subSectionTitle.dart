//Card con titulo y proporciones para divir en 3
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';
import 'customText.dart';

// ignore: must_be_immutable
class SubSectionTitle extends StatelessWidget {
  //Variables
  String data;

  //Constructor
  SubSectionTitle({this.data});

  //Widget
  @override
  Widget build(BuildContext context) {
    double marginV = getVerticalMargin(context);
    return Card(
        margin: EdgeInsets.all(marginV),
        color: red,
        child: Container(
            alignment: Alignment.center,
            width: getHorizontalPercent(context, 33),
            child: Padding(
                padding: const EdgeInsets.all(4),
                child: CustomText(
                    data: data,
                    size: 18,
                    color: whiteDark,
                    weight: FontWeight.bold))));
  }
}