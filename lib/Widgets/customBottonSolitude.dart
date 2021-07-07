//Boton que permite cambiar la pantalla
import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonSolitude extends StatelessWidget {
  //Variables
  String text;
  String station;
  Widget page;
  BuildContext pageContext;

  //Constructor
  CustomButtonSolitude({this.text, this.station, this.page, this.pageContext});

  //Widget
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getVerticalMargin(context)),
      child: InkWell(
        onTap: () {
          print(station);
          if (isNotEmpty() && station != null) {
            HomeBlocInheritedWidget.of(pageContext).homebloc.nameStation =
                station;
            changePage(page, pageContext);
          }
        },
        child: Container(
            height: getVerticalPercent(context, 6),
            width: getHorizontalPercent(context, 40),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: blueNeutral,
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: CustomText(data: text, size: 14, color: whiteNeutral)),
      ),
    );
  }

  //Verificar que existan materiales
  bool isNotEmpty() {
    for (int c = 0; c < materialList.length; c++) {
      if (materialList[c].counter > 0) return true;
    }
    return false;
  }
}
