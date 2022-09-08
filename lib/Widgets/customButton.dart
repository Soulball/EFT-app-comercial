//Boton que permite cambiar la pantalla

// @dart=2.9

import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  //Variables
  String text;
  Widget page;
  BuildContext pageContext;
  bool noPop = true;

  //Constructor
  CustomButton({this.text, this.page, this.pageContext, this.noPop});

  //Widget
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(getVerticalMargin(context)),
        child: InkWell(
            onTap: () {
              if (noPop == null)
                changePage(page, pageContext);
              else {
                backToOrigin(pageContext);
                showDialogText(context, "Nota",
                    "Operacion completada. Pendiente de revisión y aprovación.");
              }
            },
            child: Container(
                height: getVerticalPercent(context, 6),
                width: getHorizontalPercent(context, 80),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: blueNeutral,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: CustomText(data: text, size: 14, color: whiteNeutral))));
  }
}
