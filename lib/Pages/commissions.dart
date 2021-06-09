import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:eft_app_comercial/Widgets/linesGraph.dart';
import 'package:eft_app_comercial/Widgets/progressBar.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

//Pagina principal de la seccion para comisiones
class Commissions extends StatefulWidget {
  Commissions({Key key}) : super(key: key);
  @override
  _CommissionsState createState() => _CommissionsState();
}

class _CommissionsState extends State<Commissions> {
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Aceites": 10,
      "Aromas": 10,
      "Minas": 10,
      "otros": 10,
    };
    return Scaffold(
        appBar: AppBar(title: CustomTextAppBar(data: 'Comisiones')),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: ListView(children: <Widget>[
              ProgressBar(actualAmount: 2, maxAmount: 20),
              ProgressBar(actualAmount: 5, maxAmount: 8),
              ProgressBar(actualAmount: 48, maxAmount: 50),
              LinesGraph(values: [5, 10, 15, 50, 30, 45], maxValue: 50),
              InkWell(child: PieChart(dataMap: dataMap), onTap: deleteUser)
            ])));
  }
}
