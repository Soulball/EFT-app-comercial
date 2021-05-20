//Barra de progreso para comisiones
import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LinesGraph extends StatefulWidget {
  //Variables
  List<double> values = <double>[1, 0, 1, 5, 8, 5];
  double maxValue = 8;

  //Constructor
  LinesGraph({this.values, this.maxValue});

  @override
  _LinesGraphState createState() => _LinesGraphState();
}

class _LinesGraphState extends State<LinesGraph> {
  Widget build(BuildContext context) {
    convertToPercent();
    final List<Feature> features = [
      Feature(color: Colors.blue, data: widget.values)
    ];
    return LineGraph(
      features: features,
      size: Size(double.infinity, getVerticalPercent(context, 40)),
      labelX: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun'],
      labelY: [
        (widget.maxValue * 0.25).toString(),
        (widget.maxValue * 0.5).toString(),
        (widget.maxValue * 0.75).toString(),
        widget.maxValue.toString()
      ],
      showDescription: false,
      graphColor: grayDark,
    );
  }

  void convertToPercent() {
    for (int c = 0; c < widget.values.length; c++) {
      widget.values[c] = widget.values[c] / widget.maxValue;
    }
  }
}
