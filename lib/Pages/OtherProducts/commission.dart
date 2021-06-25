import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
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
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.only(top: 0),
            physics: BouncingScrollPhysics(),
            children: [
              ShowUsers(),
              SizedBox(
                height: getHorizontalPercent(context, 2),
              ),
              Date(),
              MyHomePage(),
            ],
          ),
        ),
      ),
    );
  }
}
