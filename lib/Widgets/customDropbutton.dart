//Boton que permite cambiar la pantalla
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';

import 'customText.dart';

// ignore: must_be_immutable
class CustomDropButton extends StatefulWidget {
  //Variables
  List list;
  String initialValue;
  String title;
  String valueChoose;

  //Constructor
  CustomDropButton({this.list, this.initialValue, this.title});

  @override
  _CustomDropButtonState createState() => _CustomDropButtonState();
}

class _CustomDropButtonState extends State<CustomDropButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomText(
            data: widget.title,
            size: 18,
            color: grayNeutral,
            weight: FontWeight.bold),
        SizedBox(height: getVerticalMargin(context)),
        FractionallySizedBox(
          widthFactor: 1,
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(12)),
            child: DropdownButton(
                iconSize: 0,
                hint: Text(widget.initialValue),
                value: widget.valueChoose,
                onChanged: (newValue) {
                  setState(() {
                    widget.valueChoose = newValue;
                  });
                },
                items: widget.list.map((valueItem) {
                  return DropdownMenuItem(
                      value: valueItem, child: Text(valueItem));
                }).toList()),
          ),
        ),
      ],
    );
  }
}
