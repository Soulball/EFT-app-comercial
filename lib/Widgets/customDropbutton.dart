//Boton que permite cambiar la pantalla
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropButton extends StatefulWidget {
  //Variables
  List list;
  String initialValue;
  String valueChoose;

  //Constructor
  CustomDropButton({this.list, this.initialValue});

  @override
  _CustomDropButtonState createState() => _CustomDropButtonState();
}

class _CustomDropButtonState extends State<CustomDropButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: widget.valueChoose,
        hint: Text(widget.initialValue),
        onChanged: (newValue) {
          setState(() {
            widget.valueChoose = newValue;
          });
        },
        items: widget.list.map((valueItem) {
          return DropdownMenuItem(value: valueItem, child: Text(valueItem));
        }).toList());
  }
}
