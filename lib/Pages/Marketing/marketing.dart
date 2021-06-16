//Pagina principal de la seccion de marketing
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/Marketing/promotions.dart';
import 'package:eft_app_comercial/Pages/Marketing/materialSolitude1.dart';
import 'package:eft_app_comercial/Widgets/customButton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';
import 'CardSolitude.dart';
import 'activations.dart';

class Marketing extends StatelessWidget {
  Marketing({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: CustomText(
                data: 'Mercadotecnia',
                size: 30,
                color: whiteNeutral,
                weight: FontWeight.bold),
            backgroundColor: grayNeutral),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.all(getVerticalMargin(context)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CustomButton(
                  text: "Solicitud de Materiales",
                  page: MaterialSolitude1(),
                  pageContext: context),
              CustomButton(
                  text: "Solicitud de Tarjeta",
                  page: CardSolitude(),
                  pageContext: context),
              CustomButton(
                  text: "Bloque de Tarjetas",
                  page: Promotion(),
                  pageContext: context),
              CustomButton(
                  text: "Promociones", page: Promotion(), pageContext: context),
              CustomButton(
                  text: "Activaciones",
                  page: Activations(),
                  pageContext: context)
            ])));
  }
}
