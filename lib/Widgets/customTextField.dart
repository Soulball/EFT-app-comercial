//Text con estilo de fuente personalizado
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(data: title, size: 14, color: grayText),
        Container(
            padding: EdgeInsets.all(getHorizontalMargin(context)),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12)),
            child: TextField(maxLines: lines, textAlign: TextAlign.justify)),
      ],
    );
  }
}
