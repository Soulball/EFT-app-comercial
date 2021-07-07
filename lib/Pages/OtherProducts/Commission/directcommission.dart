import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class DirectCommission extends StatelessWidget {
  const DirectCommission({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          size: getVerticalPercent(context, 3.5),
          data: 'Comision Directa',
          color: grayDark,
          weight: FontWeight.bold,
        ),
        DataTable(
          dataRowHeight: getVerticalPercent(context, 4),
          columnSpacing: getHorizontalPercent(context, 9),
          horizontalMargin: getHorizontalPercent(context, 5),
          dataTextStyle: TextStyle(
            fontSize: getVerticalPercent(context, 3),
            color: Colors.black,
          ),
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Producto'),
            ),
            DataColumn(
              label: Text('Cantidad'),
            ),
            DataColumn(
              label: Text('Comision'),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('Lubricante'),
                ),
                DataCell(
                  Text('1'),
                ),
                DataCell(
                  Text('\$3.00'),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('Aditivos'),
                ),
                DataCell(
                  Text('1'),
                ),
                DataCell(
                  Text('\$3.00'),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('Minas'),
                ),
                DataCell(
                  Text('1'),
                ),
                DataCell(
                  Text('\$3.00'),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('Wipers'),
                ),
                DataCell(
                  Text('1'),
                ),
                DataCell(
                  Text('\$3.00'),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('Aromas'),
                ),
                DataCell(
                  Text('1'),
                ),
                DataCell(
                  Text('\$3.00'),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('Agua'),
                ),
                DataCell(
                  Text('1'),
                ),
                DataCell(
                  Text('\$3.00'),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('Hielo'),
                ),
                DataCell(
                  Text('1'),
                ),
                DataCell(
                  Text('\$3.00'),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('Periodico'),
                ),
                DataCell(
                  Text('1'),
                ),
                DataCell(
                  Text('\$3.00'),
                ),
              ],
            ),
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('Servicios'),
                ),
                DataCell(
                  Text('1'),
                ),
                DataCell(
                  Text('\$3.00'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
