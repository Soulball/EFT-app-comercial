import 'package:eft_app_comercial/Classes/OtherProducts/advancecommission.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'dart:async' show Future;

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
  }) : super(key: key);
  static List<AdCommission> newList = <AdCommission>[];
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AdCommission commissions = new AdCommission();
  HDTRefreshController _hdtRefreshController = HDTRefreshController();
  Future<AdCommission> futureCommission;
  @override
  void initState() {
    super.initState();
    /*futureCommission =
        getCommission(HomeBlocInheritedWidget.of(context).homebloc.user);*/
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalPercent(context, 50),
      width: getHorizontalPercent(context, 20),
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 600,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        //itemCount: commissions.commission.length,
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
        enablePullToRefresh: true,
        refreshIndicator: const WaterDropHeader(),
        refreshIndicatorHeight: 60,
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
      _getTitleItemWidget('Clasificacion', 100),
      _getTitleItemWidget('Trans', 100),
      _getTitleItemWidget('Meta', 100),
      _getTitleItemWidget('Inmediato', 100),
      _getTitleItemWidget('Acumulado', 100),
      _getTitleItemWidget('Bono', 100),
      _getTitleItemWidget('Total', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return FutureBuilder(
      //future: getCommission(HomeBlocInheritedWidget.of(context).homebloc.user),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
        return Container(
          child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          width: width,
          height: 56,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        );
      },
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(commissions.commission[index].clasification),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return FutureBuilder(
        /*future:
            getCommission(HomeBlocInheritedWidget.of(context).homebloc.user),*/
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          return Row(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(snapshot.data.points.toString()),
                      width: 100,
                      height: 52,
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: Text(snapshot.data.goal.toString()),
                      width: 100,
                      height: 52,
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: Text(snapshot.data.accumulated.toString()),
                      width: 100,
                      height: 52,
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: Text(snapshot.data.accumulated.toString()),
                      width: 100,
                      height: 52,
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: Text(snapshot.data.bonus.toString()),
                      width: 100,
                      height: 52,
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      alignment: Alignment.centerLeft,
                    ),
                    Container(
                      child: Text(snapshot.data.total.toString()),
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
        });
  }
}
