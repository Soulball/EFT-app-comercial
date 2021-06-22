import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customButton.dart';
import 'package:eft_app_comercial/Widgets/customDropbutton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'marketing.dart';

class CardSolitude extends StatefulWidget {
  CardSolitude({Key key}) : super(key: key);
  @override
  _CardSolitudeState createState() => _CardSolitudeState();
}

class _CardSolitudeState extends State<CardSolitude> {
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
            child:
                ListView(physics: BouncingScrollPhysics(), children: <Widget>[
              CustomDropButton(
                  title: "Seleccione la estación",
                  initialValue: " Estación",
                  list: stationList),
              SizedBox(height: getVerticalPercent(context, 2)),
              CustomDropButton(
                  title: "Tipo de alta",
                  initialValue: " Alta",
                  list: [" Registrar cliente", " Reposición"]),
              SizedBox(height: getVerticalPercent(context, 2)),
              CustomTextField(title: "Nombre del Cliente", lines: 1),
              SizedBox(height: getVerticalPercent(context, 2)),
              CustomTextField(title: "Teléfono del Cliente", lines: 1),
              SizedBox(height: getVerticalPercent(context, 2)),
              CustomTextField(title: "Correo Electrónico", lines: 1),
              SizedBox(height: getVerticalPercent(context, 2)),
              CustomTextField(title: "Nota / Comentario", lines: 4),
              SizedBox(height: getVerticalPercent(context, 2)),
              CustomButton(
                  text: "Enviar",
                  noPop: false,
                  page: Marketing(),
                  pageContext: context)
            ])));
  }
}
