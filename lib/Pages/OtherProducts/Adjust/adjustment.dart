import 'package:dropdown_search/dropdown_search.dart';
import 'package:eft_app_comercial/Classes/OtherProducts/adjust.dart';
import 'package:eft_app_comercial/Classes/station.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Adjust/sendadjustment.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/button.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/materialbutton.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/maxmin.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Adjustment extends StatefulWidget {
  // ignore: deprecated_member_use
  ButtonAdjust visible = new ButtonAdjust();
  // ignore: non_constant_identifier_names
  static List<String> StationList = [];
  // ignore: non_constant_identifier_names
  static List<Station> StationListClass = [];
  Adjustment({Key key, this.visible}) : super(key: key);
  @override
  _AdjustmentState createState() => _AdjustmentState();
}

class _AdjustmentState extends State<Adjustment> {
  Adjust data = Adjust();
  bool visible = false;
  String select;
  int stationid;
  @override
  Widget build(BuildContext context) {
    getStation();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        toolbarHeight: getVerticalPercent(context, 12),
        title: CustomText(
            data: 'Ajuste de Inventarios',
            size: getVerticalPercent(context, 4),
            color: whiteNeutral,
            weight: FontWeight.bold),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.only(
            left: getHorizontalPercent(context, 10),
            right: getHorizontalPercent(context, 10),
            bottom: getVerticalMargin(context),
            top: getVerticalMargin(context),
          ),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(getVerticalMargin(context)),
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              DropdownSearch(
                  label: "Estacion",
                  mode: Mode.MENU,
                  showSearchBox: true,
                  showSelectedItem: true,
                  hint: "Seleccione la Estacion",
                  selectedItem: select,
                  items: Adjustment.StationList,
                  onChanged: (dato) {
                    _getDatos(dato);
                  }),
              SizedBox(
                height: getHorizontalPercent(context, 5),
              ),
              _getVisibility(visible, stationid),
              SizedBox(
                height: getHorizontalPercent(context, 5),
              ),
              _getVisibilityB(visible, stationid),
            ],
          ),
        ),
      ),
    );
  }

  int _getmethod(String select) {
    for (int c = 0; c < Adjustment.StationList.length; c++) {
      if (select == Adjustment.StationList[c]) {
        return Adjustment.StationListClass[c].id;
      }
    }
    return 0;
  }

  Widget _getVisibility(bool visible, int station) {
    if (station == null) {
      Container(
        child: Center(child: Text("Elija una Estacion")),
      );
    } else {
      return Visibility(
        visible: visible,
        child: MaxMin(
          data: stationid,
        ),
      );
    }
    return Container();
  }

  void _getDatos(dato) {
    setState(() {
      select = dato;
      visible = true;
      stationid = _getmethod(select);
    });
  }

  _getVisibilityB(bool visible, int station) {
    if (station == null) {
      Container(
        child: Center(child: Text("Elija una Estacion")),
      );
    } else {
      return ButtonSend(
        text: "Enviar",
        sizef: 6,
        sizeh: 7,
        sizew: 60,
        page: SendAdjustment(data: stationid),
        pageContext: context,
      );
    }
    return Container();
  }
}
