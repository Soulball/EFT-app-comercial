import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/materialbutton.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

// ignore: must_be_immutable
class ViewMaxMin extends StatefulWidget {
  List<ButtonAdjust> listW = [];
  ViewMaxMin({Key key, this.listW}) : super(key: key);

  @override
  _ViewMaxMinState createState() => _ViewMaxMinState();
}

class _ViewMaxMinState extends State<ViewMaxMin> {
  @override
  Widget build(BuildContext context) {
    widget.listW.length == null
        ? Container(child: Text("Nulo"))
        : Container(
            height: getVerticalPercent(context, 50),
            child: HorizontalDataTable(
              leftHandSideColumnWidth: 100,
              rightHandSideColumnWidth: 100,
              isFixedHeader: true,
              headerWidgets: _getTitleWidget(),
              leftSideItemBuilder: _generateFirstColumnRow,
              rightSideItemBuilder: _generateRightHandSideColumnRow,
              itemCount: widget.listW.length,
              rowSeparatorWidget: const Divider(
                color: Colors.black54,
                height: 1.0,
                thickness: 0.0,
              ),
              leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
              rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
            ),
          );
    return Center(child: Text("No sirvio bien la neta"));
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('No. Producto', 100),
      _getTitleItemWidget('Accion', 100),
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
          child: Text(widget.listW[index].toString()),
          width: 90,
          height: 50,
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          alignment: Alignment.center,
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
                child: Text("widget.data.adjust[index].name.toString()"),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
            ],
          ),
        )
      ],
    );
  }
}
