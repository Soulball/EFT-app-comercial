//Boton que permite cambiar la pantalla

// @dart=2.9

import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:flutter/material.dart';
import 'customText.dart';

// ignore: must_be_immutable
class CustomDropButton extends StatefulWidget {
  //Variables
  List list;
  String initialValue;
  String title;
  String value;

  //Constructor
  CustomDropButton({this.list, this.initialValue, this.title});

  @override
  _CustomDropButtonState createState() => _CustomDropButtonState();
}

class _CustomDropButtonState extends State<CustomDropButton> {
  String valueChoose;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CustomText(
              data: widget.title,
              size: 14,
              color: grayText,
              weight: FontWeight.bold),
          FractionallySizedBox(
              widthFactor: 1,
              child: Container(
                  height: 36,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8)),
                  child: DropdownButton<String>(
                      iconSize: 0,
                      hint: Text(widget.initialValue),
                      value: valueChoose,
                      onChanged: (String newValue) {
                        setState(() {
                          valueChoose = newValue;
                          widget.value = valueChoose;
                        });
                      },
                      items: widget.list.map((valueItem) {
                        return DropdownMenuItem<String>(
                            value: valueItem, child: Text(valueItem));
                      }).toList())))
        ]);
  }
}
