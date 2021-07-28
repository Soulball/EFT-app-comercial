import 'dart:convert';

import 'package:eft_app_comercial/Classes/tutorial.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/subSectionTitle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';

//Subseccion de Tutoriales - Infografías
class Infos extends StatefulWidget {
  @override
  _InfosState createState() => _InfosState();
}

class _InfosState extends State<Infos> {
  //Variables
  ScrollController scrollController = new ScrollController();
  List<Tutorial> infoList = [];
  int offset = 0;

  @override
  void initState() {
    super.initState();
    get10(defaultStation, offset);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent)
        get10(defaultStation, offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    //Obtener el margen vertival desde la libreria
    double marginV = getVerticalMargin(context);

    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          SubSectionTitle(data: 'Infografías'),
          Expanded(
              flex: 10,
              child: ListView.builder(
                  controller: scrollController,
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
                            ]));
                  }))
        ]));
  }

  //Petición
  get10(int station, int offset) async {
    final response = await get(Uri.encodeFull(
        "http://$ip:50000/tutorial?station=$station&type=info&offset=$offset"));
    if (json.decode(response.body)["tutorial"] != null) {
      setState(() {
        List data = json.decode(response.body)["tutorial"];
        for (int c = 0; c < data.length; c++) {
          infoList.add(
              new Tutorial(name: data[c]["name"], source: data[c]["source"]));
        }
        this.offset = this.offset + 10;
      });
    }
  }
}
