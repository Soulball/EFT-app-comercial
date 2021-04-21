import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/temporal_List.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/subSectionTitle.dart';
import 'package:flutter/material.dart';

//Subseccion de Tutoriales - Manuales
class Manuals extends StatefulWidget {
  @override
  _ManualsState createState() => _ManualsState();
}

class _ManualsState extends State<Manuals> {
  @override
  Widget build(BuildContext context) {
    //Obtener margen vertical desde libreria
    double marginV = getVerticalMargin(context);
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
          SubSectionTitle(data: 'Manuales', context: context),
          Expanded(
              flex: 10,
              child: ListView.builder(
                  itemCount: manualList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      margin: EdgeInsets.all(marginV),
                      child: ListTile(
                        leading: Icon(Icons.event,
                            color: blueDark,
                            size: getVerticalPercent(context, 10)),
                        title: Text(manualList[index].name),
                        subtitle: CustomText(data: 'Descripcion del manual'),
                        trailing: InkWell(
                            onTap: () {
                              openURL(manualList[index].source);
                            },
                            child: Icon(Icons.link)),
                      ),
                    );
                  }))
        ]));
  }
}