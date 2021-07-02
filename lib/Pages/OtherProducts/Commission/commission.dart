import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/catalogue.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/button.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/date.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/prueba.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/showusers.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class Commission extends StatefulWidget {
  Commission({Key key}) : super(key: key);

  @override
  _CommissionState createState() => _CommissionState();
}

class _CommissionState extends State<Commission> {
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
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(getVerticalMargin(context)),
            physics: BouncingScrollPhysics(),
            children: [
              ShowUsers(),
              Date(),
              SizedBox(
                height: getHorizontalPercent(context, 2),
              ),
              MyHomePage(),
              SizedBox(
                height: getHorizontalPercent(context, 4),
              ),
              CustomText(
                data: 'Total a pagar | ' + '\$',
                size: getVerticalPercent(context, 4),
              ),
              SizedBox(
                height: getHorizontalPercent(context, 4),
              ),
              ButtonSend(
                sizeh: 20,
                sizew: 100,
                text: 'Catalogo de Comisiones',
                sizef: 5,
                page: Catalogue(),
                pageContext: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
