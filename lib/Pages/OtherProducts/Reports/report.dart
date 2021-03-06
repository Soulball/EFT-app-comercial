import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Reports/requestreport.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/button.dart';
import 'package:eft_app_comercial/Widgets/customDropbutton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  Report({Key key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    var stationCDB = CustomDropButton(
      title: "Seleccione la estación",
      initialValue: "Estación",
      list: stationList,
    );
    var exhibidorCDB = CustomDropButton(
      title: 'Selecciona el exhibidor',
      initialValue: 'Exhibidor',
      list: exhibidores,
    );

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
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(
              left: getHorizontalPercent(context, 10),
              right: getHorizontalPercent(context, 10),
              bottom: getVerticalMargin(context),
              top: getVerticalMargin(context)),
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(top: 0),
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: getHorizontalPercent(context, 5),
              ),
              stationCDB,
              SizedBox(
                height: getHorizontalPercent(context, 5),
              ),
              exhibidorCDB,
              SizedBox(
                height: getHorizontalPercent(context, 40),
              ),
              ButtonSend(
                sizeh: 10,
                sizew: 80,
                sizef: 5,
                text: 'Enviar',
                page: RequestReport(),
                pageContext: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
