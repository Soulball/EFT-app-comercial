import 'dart:ui';
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
  Adjust data = Adjust();
  MaxMin({Key key, this.data}) : super(key: key);
  @override
  _MaxMinState createState() => _MaxMinState();
}

List<AdjustElement> listap = [];
List<ButtonAdjust> listaW = [];
String select = "Sin Cambios";
Color picture = Colors.grey;
int count = 0;

class _MaxMinState extends State<MaxMin> {
  @override
  Widget build(BuildContext context) {
    _getButton(widget.data);
    return Container(
      height: getVerticalPercent(context, 50),
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 140,
        rightHandSideColumnWidth: 400,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: widget.data.adjust.length,
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
          child: Text(widget.data.adjust[index].codes.toString()),
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
                child: Text(widget.data.adjust[index].name.toString()),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(widget.data.adjust[index].name),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(widget.data.adjust[index].max.toString()),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              ),
              Container(
                child: Text(widget.data.adjust[index].min.toString()),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              ),
            ],
          ),
        )
      ],
    );
  }
}

void _getButton(Adjust data) {
  listaW.clear();
  for (int c = 0; c < data.adjust.length; c++) {
    listaW.add(new ButtonAdjust());
  }
  _getSendButton(listaW);
  print(listaW.length);
}

Widget _getSendButton(List<ButtonAdjust> listaW) {
  print(listaW.length);
  if (listaW != null) {
    return ViewMaxMin(listW: listaW);
  } else {
    return Container();
  }
}
