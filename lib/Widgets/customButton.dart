//Boton que permite cambiar la pantalla
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  //Variables
  String text;
  Widget page;
  BuildContext pageContext;

  //Constructor
  CustomButton({this.text, this.page, this.pageContext});

  //Widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getVerticalMargin(context)),
      child: InkWell(
        onTap: changePage,
        child: Container(
            height: getVerticalPercent(context, 6),
            width: getHorizontalPercent(context, 80),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: blueNeutral,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: CustomText(data: text, size: 14, color: whiteNeutral)),
      ),
    );
  }

  void changePage() {
    final route = MaterialPageRoute(builder: (BuildContext context) {
      return page;
    });
    Navigator.of(pageContext).push(route);
  }
}
