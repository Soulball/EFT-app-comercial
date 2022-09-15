// @dart=2.9

import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/Marketing/promotions.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Ranking/ranking.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Reports/report.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/commission.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Adjust/adjustment.dart';
import 'package:eft_app_comercial/Widgets/customButton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

import '../../Libraries/media.dart';

class OtherProduct extends StatelessWidget {
  OtherProduct({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
              data: 'Otros Productos',
              size: 30,
              color: whiteNeutral,
              weight: FontWeight.bold),
          backgroundColor: grayNeutral),
      body: GridView(
        padding: EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            mainAxisExtent: 175,
            childAspectRatio: 1),
        children: [
          Card(
            color: Colors.blue,
            child: GestureDetector(
              onTap: () {
                changePage(Promotion(), context);
              },
              child: Container(
                child: Text("Promociones"),
              ),
            ),
          ),
          Card(
            color: Colors.blue,
            child: GestureDetector(
              onTap: () {
                changePage(Ranking(), context);
              },
              child: Container(
                child: Text("Ranking"),
              ),
            ),
          ),
          Card(
            color: Colors.blue,
            child: GestureDetector(
              onTap: () {
                changePage(CommissionT(), context);
              },
              child: Container(
                child: Text("Comisiones"),
              ),
            ),
          ),
          Card(
            color: Colors.blue,
            child: GestureDetector(
              onTap: () {
                changePage(Adjustment(), context);
              },
              child: Container(
                child: Text("Ajuste de Inventario"),
              ),
            ),
          ),
          Card(
            color: Colors.blue,
            child: GestureDetector(
              onTap: () {
                changePage(Report(), context);
              },
              child: Container(
                child: Text("Reportar"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
