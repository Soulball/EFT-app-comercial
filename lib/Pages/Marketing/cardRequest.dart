import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customButton.dart';
import 'package:eft_app_comercial/Widgets/customDropbutton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
            padding: EdgeInsets.only(
                left: getHorizontalPercent(context, 10),
                right: getHorizontalPercent(context, 10),
                bottom: getVerticalMargin(context),
                top: getVerticalMargin(context)),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
              CustomDropButton(
                  title: "Seleccione la estación",
                  initialValue: " Estación",
                  list: stationList),
              SizedBox(height: getVerticalPercent(context, 4)),
              CustomDropButton(
                  title: "Tipo de activación",
                  initialValue: " Tipo de activación",
                  list: activationType),
              SizedBox(height: getVerticalPercent(context, 4)),
              CustomTextField(title: "Describe el proposito de la activación", lines: 10),
              SizedBox(height: getVerticalPercent(context, 4)),
              CustomButton(text: "Confirmar")
            ])));
  }
}
