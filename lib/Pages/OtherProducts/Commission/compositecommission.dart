import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/cine.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/seguros.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/tae.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/toroshop.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/buttondescription.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class CompositeCommission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                  Text('TAE'),
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
            DataRow(
              cells: [
                DataCell(
                  Text('Seguros'),
                ),
                DataCell(
                  Text('_____________________'),
                ),
                DataCell(
                  ButtonDescription(
                    page: Seguros(),
                    pageContext: context,
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Text('Cine'),
                ),
                DataCell(
                  Text('_____________________'),
                ),
                DataCell(
                  ButtonDescription(
                    page: Cine(),
                    pageContext: context,
                  ),
                ),
              ],
            ),
            DataRow(
              cells: [
                DataCell(
                  Text('Toroshop'),
                ),
                DataCell(
                  Text('_____________________'),
                ),
                DataCell(
                  ButtonDescription(
                    page: Toroshop(),
                    pageContext: context,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
