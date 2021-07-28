import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';

class AdvanceCommission extends StatelessWidget {
  const AdvanceCommission({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DataTable(
          dataRowHeight: getVerticalPercent(context, 6),
          columnSpacing: getHorizontalPercent(context, 35),
          horizontalMargin: getHorizontalPercent(context, 0),
          dataTextStyle: TextStyle(
            fontSize: getVerticalPercent(context, 3),
            color: Colors.black,
          ),
          columns: const <DataColumn>[
            DataColumn(
              label: Text('Poducto'),
            ),
            DataColumn(
              label: Text('Transacciones'),
            ),
          ],
          rows: const <DataRow>[
            DataRow(
              cells: <DataCell>[
                DataCell(
                  Text('Lubricante'),
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
