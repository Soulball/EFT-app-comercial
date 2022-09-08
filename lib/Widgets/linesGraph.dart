//Barra de progreso para comisiones

// @dart=2.9

import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LinesGraph extends StatefulWidget {
  //Variables
  List<List<double>> values;
  double maxValue;

  //Constructor
  LinesGraph({this.values, this.maxValue});

  @override
  _LinesGraphState createState() => _LinesGraphState();
}

class _LinesGraphState extends State<LinesGraph> {
  Widget build(BuildContext context) {
    convertToPercent();
    final List<Feature> features = [
      Feature(color: Colors.blue, data: widget.values[0], title: "Aceites"),
      Feature(color: Colors.red, data: widget.values[1], title: "Agua"),
      Feature(color: Colors.green, data: widget.values[2], title: "Aroma"),
      Feature(color: Colors.orange, data: widget.values[3], title: "Cine"),
      Feature(color: Colors.pink, data: widget.values[4], title: "Hielo"),
      Feature(color: Colors.purple, data: widget.values[5], title: "Minas"),
      Feature(color: Colors.brown, data: widget.values[6], title: "Seguros"),
      Feature(color: Colors.cyan, data: widget.values[7], title: "Servicios"),
      Feature(color: Colors.black, data: widget.values[8], title: "Tae"),
      Feature(color: Colors.grey, data: widget.values[9], title: "Toro Shop"),
      Feature(color: Colors.yellow, data: widget.values[10], title: "Wipers")
    ];
    return LineGraph(
      features: features,
      size: Size(double.infinity, getVerticalPercent(context, 50)),
      labelX: ['3 Meses', '2 Meses', '1 Mes', 'Actual'],
      labelY: [
        (widget.maxValue * 0.25).toString(),
        (widget.maxValue * 0.5).toString(),
        (widget.maxValue * 0.75).toString(),
        widget.maxValue.toString()
      ],
      showDescription: true,
      graphColor: grayDark,
    );
  }

  void convertToPercent() {
    for (int c = 0; c < widget.values.length; c++) {
      for (int i = 0; i < widget.values[c].length; i++) {
        widget.values[c][i] = widget.values[c][i] / widget.maxValue;
      }
    }
  }
}
