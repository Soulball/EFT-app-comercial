import 'package:eft_app_comercial/Classes/announcement.dart';
import 'package:eft_app_comercial/Classes/detail.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/temporal_List.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

//Detalles de las promociones
class PromotionDetails extends StatelessWidget {
  PromotionDetails({Key key, this.announcement}) : super(key: key);
  final Announcement announcement;
  //Listas
  static List<Detail> detailList = <Detail>[];

  @override
  Widget build(BuildContext context) {
    double margin = getVerticalMargin(context);
    double tripleMargin = margin * 3;
    return Scaffold(
        appBar: AppBar(
            title: CustomText(
                data: announcement.name,
                size: 20,
                color: grayText,
                weight: FontWeight.bold),
            backgroundColor: graySubtitle),
        body: Container(
            height: double.infinity,
            child: Column(children: [
              Expanded(
                  flex: 10,
                  child: ListView(children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: tripleMargin, bottom: tripleMargin),
                      child: InkWell(
                          onTap: () {
                            showDialogText(
                                context, "Descripción", announcement.text);
                          },
                          child: Container(
                              height: getVerticalPercent(context, 56),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  image: DecorationImage(
                                      image: NetworkImage(announcement.image),
                                      fit: BoxFit.fill)))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: margin),
                      child: CustomText(
                          data: "Detalles de la promoción.",
                          size: 18,
                          color: grayText),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: margin),
                      child:
                          CustomText(data: "Notas:", size: 18, color: grayText),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: tripleMargin),
                        child: Container(
                            height: getVerticalPercent(context, 15),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: detail2List.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding: EdgeInsets.only(left: margin, bottom: margin),
                                      child: Container(
                                          width:
                                              getHorizontalPercent(context, 45),
                                          padding: EdgeInsets.all(margin),
                                          decoration: BoxDecoration(
                                              color: purpleLigth,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(15))),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: <Widget>[
                                                CustomText(
                                                    data: detail2List[index]
                                                        .title,
                                                    size: 20,
                                                    color: whiteLight,
                                                    weight: FontWeight.bold),
                                                CustomText(
                                                    data: detail2List[index]
                                                        .subtitle,
                                                    size: 16,
                                                    color: whiteLight)
                                              ])));
                                })))
                  ]))
            ])));
  }
}
