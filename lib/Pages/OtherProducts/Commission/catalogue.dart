// @dart=2.9

import 'package:eft_app_comercial/Classes/OtherProducts/descriptioncommission.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/compositecommission.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/directcommission.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/showusers.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

List<DescriptionElement> data = <DescriptionElement>[];
List<DescriptionElement> datac = <DescriptionElement>[];

class Catalogue extends StatelessWidget {
  const Catalogue({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
              data: 'Catalogo de Comisiones',
              size: 20,
              color: whiteNeutral,
              weight: FontWeight.bold),
          backgroundColor: grayNeutral),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(
            left: getHorizontalPercent(context, 5),
            right: getHorizontalPercent(context, 5),
            bottom: getVerticalMargin(context),
            top: getVerticalMargin(context),
          ),
          child: FutureBuilder(
              future: getDescription(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator());
                final List<DescriptionElement> item = snapshot.data.descriptions
                    .where((d) => d.hasDetail == 0)
                    .toList();
                final List<DescriptionElement> itemc = snapshot
                    .data.descriptions
                    .where((c) => c.hasDetail == 1)
                    .toList();
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ShowUsers(),
                    SizedBox(
                      height: getVerticalPercent(context, 10),
                    ),
                    Text("Comisiones Directas"),
                    DirectCommission(
                      data: item,
                    ),
                    SizedBox(
                      height: getVerticalPercent(context, 10),
                    ),
                    Text("Comisiones Compuestas"),
                    CompositeCommission(
                      datac: itemc,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
