import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Classes/OtherProducts/advancecommission.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class Commissions extends StatefulWidget {
  Commissions({
    Key key,
  }) : super(key: key);

  @override
  _CommissionsState createState() => _CommissionsState();
}

class _CommissionsState extends State<Commissions> {
  HDTRefreshController _hdtRefreshController = HDTRefreshController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            getcommissions(HomeBlocInheritedWidget.of(context).homebloc.user),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          return Container(
            height: getVerticalPercent(context, 60),
            child: HorizontalDataTable(
              leftHandSideColumnWidth: 100,
              rightHandSideColumnWidth: 500,
              isFixedHeader: true,
              headerWidgets: _getTitleWidget(),
              leftSideItemBuilder: _generateFirstColumnRow,
              rightSideItemBuilder: _generateRightHandSideColumnRow,
              itemCount: snapshot.data.commission.length,
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
        });
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
    return FutureBuilder(
        future:
            getcommissions(HomeBlocInheritedWidget.of(context).homebloc.user),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.commission.length,
              itemBuilder: (BuildContext context, int index) {
                final Commission acommission = snapshot.data.commission[index];
                return Container(
                  child: Text(acommission.classification),
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
        future:
            getcommissions(HomeBlocInheritedWidget.of(context).homebloc.user),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.commission.length,
              itemBuilder: (BuildContext context, int index) {
                final Commission acommission = snapshot.data.commission[index];
                return Row(children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          child: Text(acommission.points.toString()),
                          width: 100,
                          height: 52,
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                        ),
                        Container(
                          child: Text(acommission.goal.toString()),
                          width: 100,
                          height: 52,
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                        ),
                        Container(
                          child:
                              Text("\$ " + acommission.accumulated.toString()),
                          width: 100,
                          height: 52,
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                        ),
                        Container(
                          child: Text(acommission.bonus.toString()),
                          width: 100,
                          height: 52,
                          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                          alignment: Alignment.centerLeft,
                        ),
                        Container(
                          child: Text("\$ " + acommission.total.toString()),
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
