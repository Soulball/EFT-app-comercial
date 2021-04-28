import 'package:eft_app_comercial/Classes/new.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/temporal_List.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:flutter/material.dart';

//Detalles de las promociones
class PromotionDetails extends StatelessWidget {
  PromotionDetails({Key key, this.newId}) : super(key: key);
  final New newId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: CustomTextAppBar(data: 'Detalles')),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(children: [
              Container(
                  height: getVerticalPercent(context, 10),
                  color: graySubtitle,
                  alignment: Alignment.centerLeft,
                  child: Padding(
                      padding: EdgeInsets.all(getVerticalMargin(context)),
                      child: CustomText(
                          data: newId.name,
                          size: 18,
                          color: grayText,
                          weight: FontWeight.bold))),
              Expanded(
                  flex: 10,
                  child: ListView(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: getVerticalPercent(context, 3),
                          bottom: getVerticalPercent(context, 3)),
                      child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return SimpleDialog(
                                      title: Text("Descripción"),
                                      backgroundColor: graySubtitle,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(
                                                getVerticalMargin(context)),
                                            child: CustomText(
                                                data: newId.text,
                                                size: 16,
                                                color: grayDark))
                                      ]);
                                });
                          },
                          child: Container(
                              height: getVerticalPercent(context, 50),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  image: DecorationImage(
                                      image: NetworkImage(newId.image),
                                      fit: BoxFit.fill)))),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: getVerticalMargin(context)),
                      child: CustomText(
                          data: "Detalles de la promoción.",
                          size: 14,
                          color: grayText),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: getVerticalMargin(context)),
                      child:
                          CustomText(data: "Notas:", size: 14, color: grayText),
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                            top: getVerticalPercent(context, 3)),
                        child: Container(
                            height: getVerticalPercent(context, 15),
                            width: double.infinity,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: detailsList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: getVerticalMargin(context),
                                        right: getVerticalMargin(context)),
                                    child: Container(
                                        height: getVerticalPercent(context, 15),
                                        width:
                                            getHorizontalPercent(context, 45),
                                        padding: EdgeInsets.all(
                                            getVerticalMargin(context)),
                                        decoration: BoxDecoration(
                                            color: purpleLigth,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(15))),
                                        child: Column(
                                          children: <Widget>[
                                            CustomText(
                                                data: detailsList[index].title,
                                                size: 14,
                                                color: whiteLight,
                                                weight: FontWeight.bold),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Container(
                                                      height:
                                                          getVerticalPercent(
                                                              context, 7.5),
                                                      width: getVerticalPercent(
                                                          context, 7.5),
                                                      decoration: BoxDecoration(
                                                          color: purpleDark,
                                                          shape:
                                                              BoxShape.circle)),
                                                  Container(
                                                    height: getVerticalPercent(
                                                        context, 8),
                                                    width: getHorizontalPercent(
                                                        context, 25),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: CustomText(
                                                        data: detailsList[index]
                                                            .subtitle,
                                                        size: 14,
                                                        color: whiteLight),
                                                  )
                                                ])
                                          ],
                                        )),
                                  );
                                })))
                  ])),
              Container(
                  height: getVerticalPercent(context, 10),
                  width: double.infinity,
                  child: Row(children: <Widget>[
                    Container(
                        width: getHorizontalPercent(context, 70),
                        color: graySubtitle2),
                    Container(
                        height: getVerticalPercent(context, 10),
                        width: getHorizontalPercent(context, 30),
                        color: blueDark,
                        alignment: Alignment.center,
                        child: CustomText(
                            data: "Unidad Segundo",
                            size: 12,
                            color: whiteLight))
                  ]))
            ])));
  }
}
