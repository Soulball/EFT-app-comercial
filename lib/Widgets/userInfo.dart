//Text con estilo de fuente personalizado

// @dart=2.9

import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';
import 'customText.dart';

// ignore: must_be_immutable
class UserInfo extends StatelessWidget {
  //Variables
  String user;
  String station;

  //Constructor
  UserInfo({this.user, this.station});

  //Widget
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomText(data: "Solicita | " + user, size: 14, color: grayText),
      CustomText(data: "Estación | " + station, size: 14, color: grayText),
      CustomText(data: "Turno | " + getTurn(), size: 14, color: grayText),
      Padding(
          padding: EdgeInsets.all(getVerticalMargin(context)),
          child: Container(height: 4, width: double.infinity, color: grayText))
    ]);
  }
}
