import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Settings/sendadjustment.dart';
import 'package:eft_app_comercial/Pages/commissions.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/button.dart';
import 'package:eft_app_comercial/Widgets/customDropbutton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class Adjustment extends StatelessWidget {
  Adjustment({Key key}) : super(key: key);

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
            left: getHorizontalPercent(context, 10),
            right: getHorizontalPercent(context, 10),
            bottom: getVerticalMargin(context),
            top: getVerticalMargin(context),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(top: 0),
            physics: BouncingScrollPhysics(),
            children: [
              CustomDropButton(
                title: "Seleccione la estación",
                initialValue: "Estación",
                list: stationList,
              ),
              SizedBox(
                height: getHorizontalPercent(context, 5),
              ),
              Commissions(),
              SizedBox(
                height: getHorizontalPercent(context, 5),
              ),
              ButtonSend(
                sizef: 5,
                sizew: 50,
                sizeh: 10,
                text: 'Ajuste de Inventario',
                page: SendAdjustment(),
                pageContext: context,
              )
            ],
          ),
        ),
      ),
    );
  }
}
