import 'package:eft_app_comercial/Classes/OtherProducts/advancecommission.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

// ignore: must_be_immutable
class CommissionsTa extends StatelessWidget {
  Acommission dataco;
  CommissionsTa({Key key, this.dataco}) : super(key: key);

  HDTRefreshController _hdtRefreshController = HDTRefreshController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalPercent(context, 60),
      child: HorizontalDataTable(
        leftHandSideColumnWidth: getHorizontalPercent(context, 40),
        rightHandSideColumnWidth: getHorizontalPercent(context, 125),
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: dataco.commission.length,
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
        enablePullToRefresh: true,
        refreshIndicator: const WaterDropHeader(),
        refreshIndicatorHeight: 30,
        onRefresh: () async {
          //Do sth
          await Future.delayed(const Duration(milliseconds: 500));
          _hdtRefreshController.refreshCompleted();
        },
        htdRefreshController: _hdtRefreshController,
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget("Clasificacion", 100),
      _getTitleItemWidget("Trans", 50),
      _getTitleItemWidget('Meta', 50),
      _getTitleItemWidget('Acumulado', 100),
      _getTitleItemWidget('Bono', 50),
      _getTitleItemWidget('Total', 50)
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
    return Container(
      child: Text(dataco.commission[index].classification),
      width: getHorizontalPercent(context, 20),
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(children: <Widget>[
      Container(
        child: Row(
          children: <Widget>[
            Container(
              child: Text(dataco.commission[index].points.toString()),
              width: getHorizontalPercent(context, 25),
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
            Container(
              child: Text(dataco.commission[index].goal.toString()),
              width: getHorizontalPercent(context, 25),
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
            Container(
              child:
                  Text("\$ " + dataco.commission[index].accumulated.toString()),
              width: getHorizontalPercent(context, 25),
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
            Container(
              child: Text(dataco.commission[index].bonus.toString()),
              width: getHorizontalPercent(context, 25),
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
            Container(
              child: Text("\$ " + dataco.commission[index].total.toString()),
              width: getHorizontalPercent(context, 25),
              height: 52,
              padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
              alignment: Alignment.centerLeft,
            ),
          ],
        ),
      ),
    ]);
  }
}
