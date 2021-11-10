import 'package:dropdown_search/dropdown_search.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Adjust/adjustment.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Reports/report.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Reports/sendreport.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/button.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/counter.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/customchecklist.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextField.dart';
import 'package:eft_app_comercial/Widgets/imagePicker.dart';
import 'package:eft_app_comercial/Widgets/itemCounter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';

// ignore: must_be_immutable
class RequestReport extends StatefulWidget {
  CustomCounter count = CustomCounter();
  int data;
  RequestReport({Key key, this.data, this.count}) : super(key: key);
  @override
  _RequestReportState createState() => _RequestReportState();
}

String selectS;
bool select = true;
bool select2 = false;
Color colors;

class _RequestReportState extends State<RequestReport> {
  int select;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        toolbarHeight: getVerticalPercent(context, 10),
        title: CustomText(
            data: 'Otros Productos',
            size: getVerticalPercent(context, 5),
            color: whiteNeutral,
            weight: FontWeight.bold),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(
              left: getHorizontalPercent(context, 5),
              right: getHorizontalPercent(context, 5),
              bottom: getVerticalMargin(context),
              top: getVerticalMargin(context)),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _getWidget(widget.data),
                Container(
                  height: getVerticalPercent(context, 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: getVerticalPercent(context, 30),
                        width: getHorizontalPercent(context, 60),
                        child: CustomTextField(
                            lines: 4,
                            title: "Descripción de materiales y medidas"),
                      ),
                      Container(
                        height: getVerticalPercent(context, 15),
                        width: getHorizontalPercent(context, 25),
                        child: ImagePicker(),
                      ),
                    ],
                  ),
                ),
                ButtonSend(
                    text: "Enviar",
                    sizef: 6,
                    sizeh: 7,
                    sizew: 60,
                    page: SendReport(),
                    pageContext: context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getWidget(data) {
    Report.CExhibitorString.clear();
    Report.CExhibitorsList.clear();
    switch (data) {
      case 1:
        return _aceite(data);
        break;
      case 2:
        return _ciel(data);
        break;
      case 3:
        return _toros();
        break;
      case 4:
        return _gas();
        break;
      case 5:
        return _aromas();
        break;
      default:
    }
    return Container(
      child: Text("Hola"),
    );
  }
}

Widget _aceite(descripcion) {
  return SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: Column(
      children: [
        DropdownSearch(
          label: "Estacion",
          mode: Mode.MENU,
          showSearchBox: true,
          showSelectedItem: true,
          hint: "Seleccione la Estacion",
          selectedItem: selectS,
          items: Adjustment.StationList,
          onChanged: (dato) {
            selectS = dato;
          },
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 100,
          child: FutureBuilder(
              future: getCExhibitors(descripcion),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                return ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: Report.CExhibitorsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCounter(
                        item: Report.CExhibitorString[index],
                      );
                    });
              }),
        ),
      ],
    ),
  );
}

Widget _ciel(descripcion) {
  return Container(
    height: 150,
    child: FutureBuilder(
        future: getCExhibitors(descripcion),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: Report.CExhibitorsList.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: colors,
                  child: CustomCheckList(
                    select: select,
                    select2: select2,
                    component: Text(Report.CExhibitorString[index]),
                  ),
                );
              });
        }),
  );
}

Widget _toros() {
  return ListView(
    physics: BouncingScrollPhysics(),
    children: [
      Container(
        child: Text("Toros"),
      )
    ],
  );
}

Widget _gas() {
  return ListView(
    physics: BouncingScrollPhysics(),
    children: [
      Container(
        child: Text("Gas"),
      )
    ],
  );
}

Widget _aromas() {
  return ListView(
    physics: BouncingScrollPhysics(),
    children: [
      Container(
        child: Text("Aromas"),
      )
    ],
  );
}
