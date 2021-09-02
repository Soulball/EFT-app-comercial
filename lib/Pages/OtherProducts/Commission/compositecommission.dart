import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Classes/OtherProducts/descriptioncommission.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/tae.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/buttondescription.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class CompositeCommission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getDescription(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: null,
              itemBuilder: (BuildContext context, int index) {
                final DescriptionElement product =
                    snapshot.data.descriptions[index];
                return Container(
                  width: getHorizontalPercent(context, 100),
                  height: getVerticalPercent(context, 30),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        CustomText(
                          size: getVerticalPercent(context, 3),
                          data: 'Comision Compuesta',
                          color: grayDark,
                          weight: FontWeight.bold,
                        ),
                        DataTable(
                          dataRowHeight: getVerticalPercent(context, 4),
                          columnSpacing: getHorizontalPercent(context, 0.5),
                          horizontalMargin: getHorizontalPercent(context, 1),
                          dataTextStyle: TextStyle(
                            fontSize: getVerticalPercent(context, 3),
                            color: Colors.black,
                          ),
                          columns: [
                            DataColumn(
                              label: Text('Producto'),
                            ),
                            DataColumn(
                              label: Text('        '),
                            ),
                            DataColumn(
                              label: Text('        '),
                            ),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(
                                  Text(product.classificationName),
                                ),
                                DataCell(
                                  Text('_____________________'),
                                ),
                                DataCell(
                                  ButtonDescription(
                                    page: Tae(),
                                    pageContext: context,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
