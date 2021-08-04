import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:eft_app_comercial/Widgets/linesGraph.dart';
import 'package:eft_app_comercial/Widgets/progressBar.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';

//Pagina principal de la seccion para comisiones
class Commissions extends StatefulWidget {
  Commissions({Key key}) : super(key: key);
  @override
  _CommissionsState createState() => _CommissionsState();
}

class _CommissionsState extends State<Commissions> {
  List<String> itemList = [
    "Aceites",
    "Agua",
    "Aromas",
    "Cine",
    "Hielo",
    "Minas",
    "Periodico",
    "Seguros",
    "Servicios",
    "Tae",
    "Toro Shop",
    "Wipers"
  ];

  List<double> maxCountList = [16, 10, 5, 10, 3, 5, 10, 3, 5, 5, 3, 3];
  List<double> amountList = [14, 6, 5, 6, 2, 2, 5, 2, 4, 5, 2, 2];
  List<List<double>> itemPermonthList = [
    [16, 16, 16, 15],
    [7, 10, 8, 6],
    [4, 0, 1, 2],
    [4, 0, 1, 2],
    [10, 9, 10, 6],
    [3, 3, 3, 2],
    [0, 0, 3, 2],
    [10, 8, 8, 5],
    [1, 0, 3, 2],
    [2, 5, 5, 4],
    [5, 5, 5, 5],
    [2, 3, 3, 2],
    [3, 3, 3, 2]
  ];

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Aceites": amountList[0],
      "Agua": amountList[1],
      "Aromas": amountList[2],
      "Cine": amountList[3],
      "Hielo": amountList[4],
      "Minas": amountList[5],
      "Periodico": amountList[6],
      "Seguros": amountList[7],
      "Servicios": amountList[8],
      "Tae": amountList[9],
      "Toro Shop": amountList[10],
      "Wipers": amountList[11]
    };
    uploadActivation(123456888, 9999, "alta", "Detalles");
    return Scaffold(
        appBar: AppBar(title: CustomTextAppBar(data: 'Comisiones')),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child:
                ListView(physics: BouncingScrollPhysics(), children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(
                      left: getVerticalMargin(context),
                      top: getVerticalMargin(context)),
                  child: CustomText(
                      data: "Progreso de Metas",
                      size: 24,
                      color: red,
                      weight: FontWeight.bold)),
              Container(
                  padding: EdgeInsets.all(getHorizontalMargin(context)),
                  height: getVerticalPercent(context, 44),
                  child: ListView.builder(
                      itemCount: itemList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                            color: grayIconDark,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Container(
                                        width:
                                            getHorizontalPercent(context, 15),
                                        child: CustomText(
                                            data: itemList[index],
                                            size: 14,
                                            color: grayDark,
                                            weight: FontWeight.bold),
                                      ),
                                      ProgressBar(
                                          actualAmount:
                                              amountList[index].toInt(),
                                          maxAmount:
                                              maxCountList[index].toInt()),
                                      Container(
                                          width:
                                              getHorizontalPercent(context, 25),
                                          child: CustomText(
                                              data: "Total: \$" +
                                                  (amountList[index] * 2.5)
                                                      .toString(),
                                              size: 18,
                                              color: (amountList[index] >=
                                                      maxCountList[index])
                                                  ? Colors.blue
                                                  : grayDark,
                                              weight: FontWeight.bold))
                                    ])));
                      })),
              Padding(
                  padding: EdgeInsets.only(
                      left: getVerticalMargin(context),
                      top: getVerticalMargin(context)),
                  child: CustomText(
                      data: "Ventas de los últimos 3 meses",
                      size: 24,
                      color: blueNeutral,
                      weight: FontWeight.bold)),
              LinesGraph(values: itemPermonthList, maxValue: 16),
              Padding(
                  padding: EdgeInsets.only(
                      left: getVerticalMargin(context),
                      top: getVerticalMargin(context)),
                  child: CustomText(
                      data: "Ventas del mes",
                      size: 24,
                      color: Colors.green,
                      weight: FontWeight.bold)),
              PieChart(dataMap: dataMap)
            ])));
  }
}
