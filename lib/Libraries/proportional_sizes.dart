// @dart=2.9

library proportional_sizes;

import 'package:flutter/material.dart';

//Obtener margen vertical
double getVerticalMargin(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.01;
}

//Obtener porcentaje vertical
double getVerticalPercent(BuildContext context, double percent) {
  return MediaQuery.of(context).size.height * (percent / 100);
}

//Obtener margen vertical
double getHorizontalMargin(BuildContext context) {
  return MediaQuery.of(context).size.width * 0.01;
}

//Obtener porcentaje vertical
double getHorizontalPercent(BuildContext context, double percent) {
  return MediaQuery.of(context).size.width * (percent / 100);
}