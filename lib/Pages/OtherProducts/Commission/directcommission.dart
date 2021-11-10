import 'package:eft_app_comercial/Classes/OtherProducts/descriptioncommission.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

// ignore: must_be_immutable
class DirectCommission extends StatelessWidget {
  final List<DescriptionElement> data;
  DirectCommission({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalPercent(context, 50),
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 300,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: data.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
        verticalScrollbarStyle: const ScrollbarStyle(
          isAlwaysShown: true,
          thickness: 4.0,
          radius: Radius.circular(5.0),
        ),
        horizontalScrollbarStyle: const ScrollbarStyle(
          isAlwaysShown: true,
          thickness: 4.0,
          radius: Radius.circular(5.0),
        ),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Producto', 100),
      _getTitleItemWidget('Comision', 100),
      _getTitleItemWidget('Cantidad', 100),
      _getTitleItemWidget('Divisa', 100),
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
    return Container(
      child: Text(data[index].classificationName),
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
            children: <Widget>[
              Container(
                child: Text(data[index].employeeAmount.toString()),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(data[index].quantity.toString()),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(data[index].currency),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
