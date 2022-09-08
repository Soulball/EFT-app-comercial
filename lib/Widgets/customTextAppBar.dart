//Text con estilo de fuente personalizado

// @dart=2.9

import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextAppBar extends StatelessWidget {
  //Variables
  String data;

  //Constructor
  CustomTextAppBar({this.data});

  //Widget
  @override
  Widget build(BuildContext context) {
    return CustomText(
        data: data, size: 34, color: grayDark, weight: FontWeight.bold);
  }
}