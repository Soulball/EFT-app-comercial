import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Reports/sendreport.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/button.dart';
import 'package:eft_app_comercial/Widgets/customDropbutton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RequestReport extends StatefulWidget {
  RequestReport({Key key}) : super(key: key);

  @override
  _RequestReportState createState() => _RequestReportState();
}

class _RequestReportState extends State<RequestReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[600],
        toolbarHeight: getVerticalPercent(context, 10),
        title: CustomText(
            data: 'Otros Productos',
            size: getVerticalPercent(context, 5),
            color: whiteNeutral,
            weight: FontWeight.bold),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.transparent,
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(
              left: getHorizontalPercent(context, 5),
              right: getHorizontalPercent(context, 5),
              bottom: getVerticalMargin(context),
              top: getVerticalMargin(context)),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              CustomDropButton(
                title: "Seleccione la estación",
                initialValue: "Estación",
                list: stationList,
              ),
              Container(
                height: getVerticalPercent(context, 20),
                width: getHorizontalPercent(context, 104),
                child: ListView.builder(
                    physics: BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: productAceite.length,
                    itemBuilder: (BuildContext context, int index) {
                      return productAceite[index];
                    }),
              ),
              CustomTextField(
                lines: 5,
                title: 'Descripcion del tipo de falla',
              ),
              SizedBox(
                height: getHorizontalPercent(context, 5),
              ),
              ButtonSend(
                sizeh: 10,
                sizew: 50,
                sizef: 5,
                text: 'Enviar',
                page: SendReport(),
                pageContext: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
