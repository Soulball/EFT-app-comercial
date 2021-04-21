import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/temporal_List.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/subSectionTitle.dart';
import 'package:flutter/material.dart';

//Subseccion de Tutoriales - Infografías
class Infos extends StatefulWidget {
  @override
  _InfosState createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  @override
  Widget build(BuildContext context) {
    //Obtener el margen vertival desde la libreria
    double marginV = getVerticalMargin(context);
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          SubSectionTitle(data: 'Infografías', context: context),
          Expanded(
              flex: 10,
              child: ListView.builder(
                  itemCount: infoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: EdgeInsets.all(marginV),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  openURL(infoList[index].source);
                                },
                                child: Image.network(infoList[index].source)),
                            Container(
                                alignment: Alignment.bottomCenter,
                                color: grayDark,
                                child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: CustomText(
                                        data: infoList[index].name,
                                        size: 18,
                                        color: whiteLight,
                                        weight: FontWeight.bold)))
                          ]),
                    );
                  }))
        ]));
  }
}
