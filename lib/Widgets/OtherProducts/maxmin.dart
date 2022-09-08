// @dart=2.9

import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/materialbutton.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/viewmaxmin.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:eft_app_comercial/Classes/OtherProducts/adjust.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';

// ignore: must_be_immutable
class MaxMin extends StatefulWidget {
  // ignore: non_constant_identifier_names
  static List<String> ChangeState = [];
  // ignore: non_constant_identifier_names
  static List<StateChange> ChangeStateClass = [];
  // ignore: non_constant_identifier_names
  static List<String> AdjustList = [];
  // ignore: non_constant_identifier_names
  static List<Adjust> AdjustListClass = [];
  int data;
  MaxMin({Key key, this.data}) : super(key: key);
  @override
  _MaxMinState createState() => _MaxMinState();
}

List<ButtonAdjust> listaW = [];

class _MaxMinState extends State<MaxMin> {
  @override
  Widget build(BuildContext context) {
    _getButton();
    getAdjust(widget.data);
    return Container(
      height: getVerticalPercent(context, 50),
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 140,
        rightHandSideColumnWidth: 400,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: MaxMin.AdjustList.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Ajuste' + "            " + 'Codigo', 140),
      _getTitleItemWidget('Producto', 100),
      _getTitleItemWidget('Tipo', 100),
      _getTitleItemWidget('Maximo', 100),
      _getTitleItemWidget('Minimo', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Row(
      children: [
        Container(
          child: listaW[index],
          width: 90,
          height: 50,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          alignment: Alignment.center,
        ),
        Container(
          child: Text(MaxMin.AdjustListClass[index].codes.toString()),
          width: 50,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Container(
                child: Text(MaxMin.AdjustListClass[index].name.toString()),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(MaxMin.AdjustListClass[index].type.toString()),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              ),
              Container(
                child: Text(MaxMin.AdjustListClass[index].max.toString()),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              ),
              Container(
                child: Text(MaxMin.AdjustListClass[index].min.toString()),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

_getButton() {
  listaW.clear();
  for (int c = 0; c < MaxMin.AdjustListClass.length; c++) {
    listaW.add(
      new ButtonAdjust(
        select: "Sin Cambios",
        picture: Colors.grey,
        count: 0,
      ),
    );
  }
  print(listaW);
  _getSendButton(listaW);
}

Widget _getSendButton(List<ButtonAdjust> listaW) {
  if (listaW != null)
    return ViewMaxMin(data: listaW);
  else
    return Container();
}
