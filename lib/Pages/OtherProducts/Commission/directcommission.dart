import 'package:eft_app_comercial/Classes/OtherProducts/descriptioncommission.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:horizontal_data_table/scroll/scroll_bar_style.dart';

class DirectCommission extends StatefulWidget {
  DirectCommission({
    Key key,
  }) : super(key: key);

  @override
  _DirectCommissionState createState() => _DirectCommissionState();
}

class _DirectCommissionState extends State<DirectCommission> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDescription(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.data.descriptions == null ||
                  snapshot.data.descriptions == []
              ? Container(child: Text("hola"))
              : Container(
                  width: getHorizontalPercent(context, 100),
                  height: getVerticalPercent(context, 50),
                  child: HorizontalDataTable(
                    leftHandSideColumnWidth: 100,
                    rightHandSideColumnWidth: 300,
                    isFixedHeader: true,
                    headerWidgets: _getTitleWidget(),
                    leftSideItemBuilder: _generateFirstColumnRow,
                    rightSideItemBuilder: _generateRightHandSideColumnRow,
                    itemCount: snapshot.data.descriptions.length,
                    rowSeparatorWidget: const Divider(
                      color: Colors.black54,
                      height: 1.0,
                      thickness: 0.0,
                    ),
                    leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
                    rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
                    verticalScrollbarStyle: const ScrollbarStyle(
                      thumbColor: Colors.yellow,
                      isAlwaysShown: true,
                      thickness: 5.0,
                      radius: Radius.circular(5.0),
                    ),
                    horizontalScrollbarStyle: const ScrollbarStyle(
                      thumbColor: Colors.red,
                      isAlwaysShown: true,
                      thickness: 5.0,
                      radius: Radius.circular(5.0),
                    ),
                  ),
                );
        });
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget("Producto", 100),
      _getTitleItemWidget("Comision", 50),
      _getTitleItemWidget('Cantidad', 50),
      _getTitleItemWidget('Divisa', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: 100,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return FutureBuilder(
        future: getDescription(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          return snapshot.data.descriptions == null ||
                  snapshot.data.descriptions == []
              ? Container(
                  child: Text("hola"),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.descriptions.length,
                  // ignore: missing_return
                  itemBuilder: (BuildContext context, int index) {
                    final DescriptionElement product =
                        snapshot.data.descriptions[index];
                    var name = product.classificationName;
                    return Container(
                      child: Text(name),
                      width: 100,
                      height: 52,
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                    );
                  });
        });
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return FutureBuilder(
        future: getDescription(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          return snapshot.data.descriptions == null
              ? Container(
                  child: Text("hola"),
                )
              : ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: snapshot.data.descriptions.length,
                  itemBuilder: (BuildContext context, int index) {
                    final DescriptionElement product =
                        snapshot.data.descriptions[index];
                    var quantity = product.quantity.toString();
                    var amount = product.employeeAmount.toString();
                    var currency = product.currency.toString();
                    return Row(children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Container(
                              child: Text(quantity),
                              width: 100,
                              height: 52,
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              child: Text(amount),
                              width: 100,
                              height: 52,
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                            ),
                            Container(
                              child: Text(currency),
                              width: 100,
                              height: 52,
                              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                              alignment: Alignment.centerLeft,
                            ),
                          ],
                        ),
                      ),
                    ]);
                  });
        });
  }
}
