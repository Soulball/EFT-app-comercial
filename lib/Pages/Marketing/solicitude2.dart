import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customButton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextField.dart';
import 'package:flutter/material.dart';

class Solitude2 extends StatelessWidget {
  Solitude2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.now();
    String turn = "1";
    if (dateTime.hour < 12) turn = "2";
    return Scaffold(
        appBar: AppBar(
            title: CustomText(
                data: 'Solicitud',
                size: 30,
                color: whiteNeutral,
                weight: FontWeight.bold),
            backgroundColor: grayText),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                left: getHorizontalPercent(context, 10),
                right: getHorizontalPercent(context, 10),
                bottom: getVerticalMargin(context),
                top: getVerticalMargin(context)),
            child: ListView(physics: BouncingScrollPhysics(), children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomText(
                    data: "Solicita | " +
                        HomeBlocInheritedWidget.of(context)
                            .homebloc
                            .name
                            .toString(),
                    size: 14,
                    color: grayText),
                CustomText(
                    data: "Estación | " +
                        HomeBlocInheritedWidget.of(context)
                            .homebloc
                            .station
                            .toString(),
                    size: 14,
                    color: grayText),
                CustomText(data: "Turno | " + turn, size: 14, color: grayText),
              ]),
              Padding(
                  padding: EdgeInsets.all(getVerticalMargin(context)),
                  child: Container(
                      height: 4, width: double.infinity, color: grayText)),
              Card(
                child: Container(
                    height: getVerticalPercent(context, 20),
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: materialList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return (materialList[index].counter > 0)
                              ? Card(
                                  child: Padding(
                                      padding: EdgeInsets.all(
                                          getHorizontalMargin(context)),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            CustomText(
                                                data: materialList[index].item,
                                                size: 24,
                                                color: grayDark,
                                                weight: FontWeight.bold),
                                            CustomText(
                                                data: materialList[index]
                                                    .counter
                                                    .toString(),
                                                size: 24,
                                                color: grayDark,
                                                weight: FontWeight.bold)
                                          ])))
                              : SizedBox(height: 1);
                        })),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: getVerticalPercent(context, 2.5),
                    bottom: getVerticalPercent(context, 2.5)),
                child: CustomTextField(
                    lines: 10, title: "Descripción de materiales y medidas"),
              ),
              CustomButton(text: "Enviar")
            ])));
  }
}
