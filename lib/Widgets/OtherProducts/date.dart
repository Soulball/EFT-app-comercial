import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Date extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomText(
      size: getHorizontalPercent(context, 6),
      data: 'Fecha: ' + DateFormat.yMd().format(DateTime.now()),
    );
  }
}
