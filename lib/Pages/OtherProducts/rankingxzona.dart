import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class RankingxZona extends StatelessWidget {
  const RankingxZona({Key key}) : super(key: key);

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
          color: Colors.transparent,
          height: double.infinity,
          width: double.infinity,
          child: ListView(
            children: [
              Container(
                color: Colors.blue,
              ),
              /* Container(
                color: Colors.green,
              ),
              Container(
                color: Colors.yellow,
              ),*/
            ],
            scrollDirection: Axis.vertical,
          ),
        ),
      ),
    );
  }
}
