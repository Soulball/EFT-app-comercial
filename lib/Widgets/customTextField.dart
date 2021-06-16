//Text con estilo de fuente personalizado
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  //Variables
  int lines;
  String title;

  //Constructor
  CustomTextField({this.lines, this.title});

  //Widget
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CustomText(
          data: title, size: 14, color: grayText, weight: FontWeight.bold),
      Container(
          height: 20 * lines.toDouble() + 16,
          decoration: BoxDecoration(
              border: Border.all(), borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.all(4),
          child: TextField(
              autofocus: false, maxLines: lines, textAlign: TextAlign.justify))
    ]);
  }
}
