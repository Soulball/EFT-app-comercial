import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/compositecommission.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Commission/directcommission.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/showusers.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class Catalogue extends StatelessWidget {
  const Catalogue({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
              data: 'Otros Productos',
              size: 30,
              color: whiteNeutral,
              weight: FontWeight.bold),
          backgroundColor: grayNeutral),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(
            left: getHorizontalPercent(context, 5),
            right: getHorizontalPercent(context, 5),
            bottom: getVerticalMargin(context),
            top: getVerticalMargin(context),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ShowUsers(),
              DirectCommission(),
              SizedBox(
                height: getVerticalPercent(context, 5),
              ),
              CompositeCommission(),
            ],
          ),
        ),
      ),
    );
  }
}
