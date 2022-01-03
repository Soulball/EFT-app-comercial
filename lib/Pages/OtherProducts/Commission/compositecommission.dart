import 'package:eft_app_comercial/Classes/OtherProducts/descriptioncommission.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/Recargas.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/cine.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/lubricantes.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/toroshop.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

// ignore: must_be_immutable

class CompositeCommission extends StatelessWidget {
  final List<DescriptionElement> datac;
  final List<DescriptionElement> dataL = <DescriptionElement>[];
  final List<DescriptionElement> dataT = <DescriptionElement>[];
  final List<DescriptionElement> dataR = <DescriptionElement>[];
  final List<DescriptionElement> dataC = <DescriptionElement>[];

  CompositeCommission({Key key, this.datac}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getVerticalPercent(context, 50),
      child: HorizontalDataTable(
        leftHandSideColumnWidth: getHorizontalPercent(context, 40),
        rightHandSideColumnWidth: getHorizontalPercent(context, 50),
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: datac.length,
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
      _getTitleItemWidget('Producto', 100),
      _getTitleItemWidget('        ', 100),
      _getTitleItemWidget('        ', 100),
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
      child: Text(datac[index].parentClassification),
      width: getHorizontalPercent(context, 40),
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
                child: Text("_____________"),
                width: getHorizontalPercent(context, 30),
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
              ),
              Container(
                width: getHorizontalPercent(context, 20),
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.center,
                child: ClipOval(
                  child: Material(
                    color: Colors.black38, // button color
                    child: InkWell(
                      onTap: () {
                        if (datac[index].parentClassification == "Cinepolis") {
                          final List<DescriptionElement> item =
                              datac[index].descriptions;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Cine(dataC: item)));
                        }
                        if (datac[index].parentClassification ==
                            "LUBRICANTES") {
                          final List<DescriptionElement> item =
                              datac[index].descriptions;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      Lubricantes(dataL: item)));
                        }
                        if (datac[index].parentClassification ==
                            "Recargas Telefónicas") {
                          final List<DescriptionElement> item =
                              datac[index].descriptions;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Recargas(dataR: item)));
                        }
                        if (datac[index].parentClassification ==
                            "TOROS SOUVENIR") {
                          final List<DescriptionElement> item =
                              datac[index].descriptions;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ToroShop(
                                        dataT: item,
                                      )));
                        }
                      },
                      child: SizedBox(
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.black54,
                          size: getVerticalPercent(context, 4),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
