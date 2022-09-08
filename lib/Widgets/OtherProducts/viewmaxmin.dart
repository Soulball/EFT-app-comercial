// @dart=2.9

import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/materialbutton.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/maxmin.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/userInfo.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewMaxMin extends StatefulWidget {
  List<ButtonAdjust> data = [];
  List<String> datac = [];
  ViewMaxMin({Key key, this.data, this.datac}) : super(key: key);

  @override
  _ViewMaxMinState createState() => _ViewMaxMinState();
}

List<ButtonAdjust> listaV = [];
List<String> listaP = [];

class _ViewMaxMinState extends State<ViewMaxMin> {
  @override
  Widget build(BuildContext context) {
    _buttonV();
    return ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          UserInfo(
              user: (HomeBlocInheritedWidget.of(context).homebloc.name != null)
                  ? HomeBlocInheritedWidget.of(context).homebloc.name
                  : "Anonimo",
              station: "1221 - Hipodromo"),
          Card(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      data: "No. Producto",
                      size: 20,
                      weight: FontWeight.bold,
                    ),
                    CustomText(
                      data: "Accion",
                      size: 20,
                      weight: FontWeight.bold,
                    )
                  ],
                ),
                Container(
                  height: getVerticalPercent(context, 20),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: listaV.length,
                    itemBuilder: (BuildContext context, int index) {
                      return (listaV[index].select != "Sin Cambios")
                          ? Card(
                              child: Padding(
                                padding: EdgeInsets.all(
                                    getHorizontalMargin(context)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CustomText(
                                        data: listaP[index],
                                        size: 20,
                                        color: grayDark,
                                        weight: FontWeight.normal),
                                    CustomText(
                                        data: listaV[index].select,
                                        size: 20,
                                        color: grayDark,
                                        weight: FontWeight.normal),
                                  ],
                                ),
                              ),
                            )
                          : SizedBox(height: 1);
                    },
                  ),
                ),
              ],
            ),
          ),
        ]);
  }

  _buttonV() {
    listaP.clear();
    listaV.clear();
    for (int a = 0; a < widget.data.length; a++) {
      listaV = widget.data.where((d) => d.select != "Sin Cambios").toList();
      if (widget.data[a].select != "Sin Cambios") {
        listaP.add(MaxMin.AdjustListClass[a].codes.toString());
      }
    }
    print(listaP.length);
  }
}
