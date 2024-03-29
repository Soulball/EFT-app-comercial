// @dart=2.9

import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

import 'materialbutton.dart';

// ignore: must_be_immutable
class ButtonSend extends StatelessWidget {
  double sizeh;
  double sizew;
  double sizef;
  String text;
  String colorg;
  Widget page;
  BuildContext pageContext;
  List<ButtonAdjust> data;

  ButtonSend(
      {this.sizeh,
      this.sizew,
      this.sizef,
      this.text,
      this.colorg,
      this.page,
      this.pageContext,
      this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getVerticalMargin(context)),
      child: MaterialButton(
        onPressed: () {
          changePage(page, pageContext);
        },
        child: Container(
          height: getVerticalPercent(context, sizeh),
          width: getHorizontalPercent(context, sizew),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.all(Radius.circular(8))),
          child: CustomText(
              data: text,
              size: getHorizontalPercent(context, sizef),
              color: whiteNeutral),
        ),
      ),
    );
  }
}
