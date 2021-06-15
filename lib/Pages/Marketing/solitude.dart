import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customButton.dart';
import 'package:eft_app_comercial/Widgets/customDropbutton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/itemCounter.dart';
import 'package:flutter/material.dart';

class Solitude extends StatelessWidget {
  Solitude({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: CustomText(
                data: 'Solicitud',
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropButton(
                      title: "Seleccione la estación",
                      list: stationList,
                      initialValue: " Estación"),
                  Container(
                    height: getVerticalPercent(context, 52),
                    width: getHorizontalPercent(context, 80),
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: materialList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return materialList[index];
                        }),
                  ),
                  CustomButton(text: "Continuar")
                ])));
  }
}
