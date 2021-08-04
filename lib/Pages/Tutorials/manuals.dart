import 'dart:convert';

import 'package:eft_app_comercial/Classes/tutorial.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/subSectionTitle.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

//Subseccion de Tutoriales - Manuales
class Manuals extends StatefulWidget {
  @override
  _ManualsState createState() => _ManualsState();
}

class _ManualsState extends State<Manuals> {
  //Variables
  ScrollController scrollController = new ScrollController();
  List<Tutorial> manualList = [];
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
    //Obtener margen vertical desde libreria
    double marginV = getVerticalMargin(context);
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          SubSectionTitle(data: 'Manuales'),
          Expanded(
              flex: 10,
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: manualList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                        margin: EdgeInsets.all(marginV),
                        child: ListTile(
                            leading: Icon(Icons.event,
                                color: blueNeutral,
                                size: getVerticalPercent(context, 10)),
                            title: Text(manualList[index].name),
                            subtitle:
                                CustomText(data: 'Descripcion del manual'),
                            trailing: InkWell(
                                onTap: () {
                                  openURL(manualList[index].source);
                                },
                                child: Icon(Icons.link))));
                  }))
        ]));
  }

  //Petición
  get10(int station, int offset) async {
    final response = await get(Uri.encodeFull(
        "http://$ip:50000/tutorial?station=$station&type=manual&offset=$offset"));
    if (json.decode(response.body)["tutorial"] != null) {
      setState(() {
        List data = json.decode(response.body)["tutorial"];
        for (int c = 0; c < data.length; c++) {
          manualList.add(
              new Tutorial(name: data[c]["name"], source: data[c]["source"]));
        }
        this.offset = this.offset + 10;
      });
    }
  }
}
