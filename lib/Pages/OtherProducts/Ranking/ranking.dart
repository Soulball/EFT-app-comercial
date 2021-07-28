import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/Marketing/promotions.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Ranking/avanceventas.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Ranking/rankingxzona.dart';
import 'package:eft_app_comercial/Widgets/customButton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class Ranking extends StatelessWidget {
  Ranking({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
              data: 'Otros Productos',
              size: 30,
              color: whiteNeutral,
              weight: FontWeight.bold),
          backgroundColor: grayNeutral),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.all(getVerticalMargin(context)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomButton(
              text: "Avance de Ventas",
              page: AvanceVentas(),
              pageContext: context),
          CustomButton(
              text: "Ranking Generales x Zona",
              page: RankingxZona(),
              pageContext: context),
          CustomButton(
              text: "Concursos", page: Promotion(), pageContext: context),
        ]),
      ),
    );
  }
}
