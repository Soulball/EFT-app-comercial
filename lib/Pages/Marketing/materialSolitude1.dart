import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/Marketing/materialSolitude2.dart';
import 'package:eft_app_comercial/Widgets/customBottonSolitude.dart';
import 'package:eft_app_comercial/Widgets/customDropbutton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class MaterialSolitude1 extends StatefulWidget {
  MaterialSolitude1({Key key}) : super(key: key);

  @override
  _MaterialSolitude1State createState() => _MaterialSolitude1State();
}

class _MaterialSolitude1State extends State<MaterialSolitude1> {
  String valueChoose;

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
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CustomText(
                            data: "Estación",
                            size: 14,
                            color: grayText,
                            weight: FontWeight.bold),
                        FractionallySizedBox(
                            widthFactor: 1,
                            child: Container(
                                height: 36,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(8)),
                                child: DropdownButton<String>(
                                    iconSize: 0,
                                    hint: Text(""),
                                    value: valueChoose,
                                    onChanged: (String newValue) {
                                      setState(() {
                                        valueChoose = newValue;
                                      });
                                    },
                                    items: stationList.map((valueItem) {
                                      return DropdownMenuItem<String>(
                                          value: valueItem,
                                          child: Text(valueItem));
                                    }).toList())))
                      ]),
                  Container(
                    height: getVerticalPercent(context, 53),
                    width: getHorizontalPercent(context, 80),
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: materialList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return materialList[index];
                        }),
                  ),
                  CustomButtonSolitude(
                      text: "Continuar",
                      station: valueChoose,
                      page: MaterialSolitude2(),
                      pageContext: context)
                ])));
  }
}
