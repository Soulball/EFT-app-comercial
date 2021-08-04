import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/otherproduct.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/button.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextField.dart';
import 'package:eft_app_comercial/Widgets/userInfo.dart';
import 'package:flutter/material.dart';

class SendAdjustment extends StatefulWidget {
  SendAdjustment({Key key}) : super(key: key);

  @override
  _SendAdjustmentState createState() => _SendAdjustmentState();
}

class _SendAdjustmentState extends State<SendAdjustment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        toolbarHeight: getVerticalPercent(context, 12),
        title: CustomText(
            data: 'Otros Productos',
            size: getVerticalPercent(context, 5),
            color: whiteNeutral,
            weight: FontWeight.bold),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(getVerticalMargin(context)),
            physics: BouncingScrollPhysics(),
            children: [
              UserInfo(
                  user: (HomeBlocInheritedWidget.of(context).homebloc.name !=
                          null)
                      ? HomeBlocInheritedWidget.of(context).homebloc.name
                      : "Anonimo",
                  station: "1221 - Hipodromo"),
              SizedBox(
                height: getHorizontalPercent(context, 10),
              ),
              DataTable(
                columns: [
                  DataColumn(
                    label: Text('No. Producto'),
                  ),
                  DataColumn(
                    label: Text('Estatus'),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(
                        Text('No. Producto 1'),
                      ),
                      DataCell(
                        Text('Subir'),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(
                        Text('No. Producto 1'),
                      ),
                      DataCell(
                        Text('Subir'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: getHorizontalPercent(context, 10),
              ),
              CustomTextField(
                lines: 7,
                title: 'Descripcion de Materiales y Medidas',
              ),
              SizedBox(
                height: getHorizontalPercent(context, 10),
              ),
              ButtonSend(
                text: 'Enviar',
                sizef: 5,
                sizeh: 10,
                sizew: 50,
                page: OtherProduct(),
                pageContext: context,
              )
            ],
          ),
        ),
      ),
    );
  }
}
