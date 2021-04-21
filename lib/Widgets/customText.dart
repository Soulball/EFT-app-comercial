//Text con estilo de fuente personalizado
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  //Variables
  String data;
  double size;
  Color color;
  FontWeight weight;

  //Constructor
  CustomText({this.data, this.size, this.color, this.weight});

  //Widget
  @override
  Widget build(BuildContext context) {
    return Text(data,
        style: TextStyle(fontSize: size, color: color, fontWeight: weight));
  }
}