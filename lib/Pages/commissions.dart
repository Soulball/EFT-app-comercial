import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:eft_app_comercial/Widgets/linesGraph.dart';
import 'package:eft_app_comercial/Widgets/progressBar.dart';
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
              LinesGraph(values: [5, 10, 15, 50, 30, 45], maxValue: 50)
            ])));
  }
}
