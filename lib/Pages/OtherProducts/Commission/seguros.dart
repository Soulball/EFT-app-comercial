import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class Seguros extends StatelessWidget {
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
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            CustomText(
              size: getVerticalPercent(context, 3.5),
              data: 'Seguros',
              color: grayDark,
              weight: FontWeight.bold,
            ),
            SizedBox(
              height: getVerticalPercent(context, 5),
            ),
            CustomText(
              size: getVerticalPercent(context, 3.5),
              data:
                  'Descripcion detallada de la comision con base al esquema d puntos o lo que aplique',
              color: grayDark,
              weight: FontWeight.bold,
            )
          ],
        ),
      ),
    );
  }
}
