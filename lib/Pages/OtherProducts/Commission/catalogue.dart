import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/date.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/showusers.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class Catalogue extends StatelessWidget {
  const Catalogue({Key key}) : super(key: key);

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
            ],
          ),
        ),
      ),
    );
  }
}
