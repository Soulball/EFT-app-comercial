import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Classes/OtherProducts/productsold.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:flutter/material.dart';

class AdvanceCommission extends StatefulWidget {
  @override
  _AdvanceCommissionState createState() => _AdvanceCommissionState();
}

class _AdvanceCommissionState extends State<AdvanceCommission> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            getTransaction(HomeBlocInheritedWidget.of(context).homebloc.user),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.products.length,
              itemBuilder: (BuildContext context, int index) {
                final Product product = snapshot.data.products[index];
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
                          label: Text('Producto'),
                        ),
                        DataColumn(
                          label: Text('Transacciones'),
                        ),
                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Text(product.classification),
                            ),
                            DataCell(
                              Text(product.transaction.toString()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                );
              });
        });
  }
}
