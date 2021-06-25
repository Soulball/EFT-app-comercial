import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class DateT extends StatefulWidget {
  DateT({Key key}) : super(key: key);

  @override
  _DateTState createState() => _DateTState();
}

class _DateTState extends State<DateT> {
  HDTRefreshController _hdtRefreshController = HDTRefreshController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: HorizontalDataTable(
            leftHandSideColumnWidth: 120,
            rightHandSideColumnWidth: 120,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
          ),
        ),
      ),
    );
  }
}

List<Widget> _getTitleWidget() {
  return [
    _getTittleItemWidget('Clasificacion', 50),
    _getTittleItemWidget('Trans', 50),
    _getTittleItemWidget('Meta', 50),
    _getTittleItemWidget('Acumulado', 50),
    _getTittleItemWidget('Bono', 50),
    _getTittleItemWidget('Total', 50),
  ];
}

Widget _getTittleItemWidget(String label, double width) {
  return Container(
    child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
    width: width,
    height: 56,
    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
    alignment: Alignment.centerLeft,
  );
}

Widget _generateFirstColumnRow(BuildContext context, int index) {
  return Container(
    child: Text('Lubircantes'),
    width: 100,
    height: 52,
    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
    alignment: Alignment.centerLeft,
  );
}

Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
  return Row(
    children: <Widget>[
      Container(
        child: Row(
          children: <Widget>[Text('Avtivo')],
        ),
        width: 100,
        height: 52,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
      Container(
        child: Text('medicina'),
        width: 200,
        height: 52,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
      Container(
        child: Text('usuario'),
        width: 100,
        height: 52,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
      Container(
        child: Text('producto'),
        width: 200,
        height: 52,
        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
        alignment: Alignment.centerLeft,
      ),
    ],
  );
}
