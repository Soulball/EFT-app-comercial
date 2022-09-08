// @dart=2.9

import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/maxmin.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/viewmaxmin.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextField.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SendAdjustment extends StatefulWidget {
  int data;
  SendAdjustment({Key key, this.data}) : super(key: key);

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
          padding: EdgeInsets.only(
              left: getHorizontalPercent(context, 5),
              right: getHorizontalPercent(context, 5)),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(getVerticalMargin(context)),
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: getHorizontalPercent(context, 5),
              ),
              ViewMaxMin(data: listaW),
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
              MaterialButton(
                onPressed: () {
                  print(widget.data);
                  getidRequest(
                      HomeBlocInheritedWidget.of(context).homebloc.user,
                      DateTime.parse(DateTime.now().toString()),
                      widget.data);
                  getSend(38, 2378, widget.data, 18, 6);
                },
                child: Container(
                  height: getVerticalPercent(context, 8),
                  width: getHorizontalPercent(context, 50),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: CustomText(
                      data: "Enviar",
                      size: getHorizontalPercent(context, 5),
                      color: whiteNeutral),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
