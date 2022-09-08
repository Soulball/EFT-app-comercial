// @dart=2.9

import 'package:dropdown_search/dropdown_search.dart';
import 'package:eft_app_comercial/Classes/OtherProducts/exhibitors.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Adjust/adjustment.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Reports/requestreport.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/button.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Report extends StatefulWidget {
  // ignore: non_constant_identifier_names
  static List<String> CExhibitorString = [];
  // ignore: non_constant_identifier_names
  static List<ComponentsExhibitor> CExhibitorsList = [];
  // ignore: non_constant_identifier_names
  static List<String> ExhibitorString = [];
  // ignore: non_constant_identifier_names
  static List<Exhibitor> ExhibitorsList = [];

  Report({Key key}) : super(key: key);
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  bool visible = false;
  String selectE;
  String selectS;
  int exhibidorId;
  @override
  Widget build(BuildContext context) {
    getExhibitors();
    getStation();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        toolbarHeight: getVerticalPercent(context, 12),
        title: CustomText(
            data: 'Reportar',
            size: getVerticalPercent(context, 5),
            color: whiteNeutral,
            weight: FontWeight.bold),
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(
              left: getHorizontalPercent(context, 10),
              right: getHorizontalPercent(context, 10),
              bottom: getVerticalMargin(context),
              top: getVerticalMargin(context)),
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(top: 0),
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: getHorizontalPercent(context, 5),
              ),
              DropdownSearch(
                  selectedItem: selectS,
                  items: Adjustment.StationList,
                  onChanged: (dato) {
                    getVisibleS(dato);
                  }),
              SizedBox(
                height: getHorizontalPercent(context, 5),
              ),
              DropdownSearch(
                  selectedItem: selectE,
                  items: Report.ExhibitorString,
                  onChanged: (dato) {
                    getVisibleE(dato);
                  }),
              SizedBox(
                height: getHorizontalPercent(context, 40),
              ),
              _getVisibility(visible, selectE, selectS),
            ],
          ),
        ),
      ),
    );
  }

  _getVisibility(bool visible, String station, String exhibidor) {
    if (station == null || exhibidor == null) {
      Container(
        child: Center(child: Text("Elija una Estacion")),
      );
    } else {
      return ButtonSend(
        text: "Enviar",
        sizef: 6,
        sizeh: 7,
        sizew: 60,
        page: RequestReport(data: exhibidorId),
        pageContext: context,
      );
    }
    return Container();
  }

  void getVisibleE(dato) {
    setState(() {
      selectE = dato;
      exhibidorId = _getMethod(selectE);
      print(exhibidorId);
    });
  }

  void getVisibleS(dato) {
    setState(() {
      selectS = dato;
    });
  }
}

int _getMethod(String select) {
  for (int c = 0; c < Report.ExhibitorString.length; c++) {
    if (select == Report.ExhibitorString[c]) {
      return Report.ExhibitorsList[c].exhibitor;
    }
  }
  return 0;
}
