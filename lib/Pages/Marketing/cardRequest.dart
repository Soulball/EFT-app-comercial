import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Widgets/customDropbutton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class CardRequest extends StatefulWidget {
  CardRequest({Key key}) : super(key: key);

  @override
  _CardRequestState createState() => _CardRequestState();
}

class _CardRequestState extends State<CardRequest> {
  String valueChoose;
  List list = ["A", "B", "C", "D"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: CustomText(
                data: 'Solicitud de Tarjeta',
                size: 30,
                color: whiteNeutral,
                weight: FontWeight.bold),
            backgroundColor: grayNeutral),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: CustomDropButton(
              initialValue: "Tipo de activación",
              list: [
                "Estrategia de Precio",
                "Otros productos",
                "Generación de tráfico"
              ],
            )));
  }
}
