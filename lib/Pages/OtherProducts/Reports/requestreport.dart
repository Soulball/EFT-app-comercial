import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
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
              CustomDropButton(
                title: "Seleccione la estación",
                initialValue: "Estación",
                list: stationList,
              ),
              SizedBox(
                height: getHorizontalPercent(context, 5),
              ),
              Container(
                color: grayLight,
                height: getVerticalPercent(context, 20),
                alignment: Alignment.centerLeft,
                child: CheckboxListTile(
                  title: Text('Acrilico'),
                  value: false,
                  onChanged: (value) {
                    if (value == true) {
                      print('Hola Mundo');
                    }
                  },
                ),
              ),
              SizedBox(
                height: getHorizontalPercent(context, 10),
              ),
              Container(
                color: grayLight,
                height: getVerticalPercent(context, 30),
                child: Row(
                  children: [
                    CustomTextField(
                      lines: 4,
                      title: 'Descripcion del Tipo de Falla',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: getHorizontalPercent(context, 10),
              ),
              Container(
                padding: EdgeInsets.all(getHorizontalMargin(context)),
                height: getVerticalPercent(context, 10),
                width: getHorizontalPercent(context, 10),
                // ignore: de
                // precated_member_use
                child: MaterialButton(
                    color: blueLight,
                    padding: EdgeInsets.all(getVerticalMargin(context)),
                    child: Text('Siguiente'),
                    onPressed: () {
                      changePage(RequestReport(), context);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
