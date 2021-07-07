import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/Marketing/materialSolitude2.dart';
import 'package:eft_app_comercial/Widgets/customDropbutton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class MaterialSolitude1 extends StatefulWidget {
  MaterialSolitude1({Key key}) : super(key: key);

  @override
  _MaterialSolitude1State createState() => _MaterialSolitude1State();
}

class _MaterialSolitude1State extends State<MaterialSolitude1> {
  CustomDropButton customDropButton = CustomDropButton(
      title: "Seleccione la estación",
      initialValue: "Estación",
      list: stationList);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: CustomText(
                data: 'Solicitud',
                size: 30,
                color: whiteNeutral,
                weight: FontWeight.bold),
            backgroundColor: grayNeutral),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                left: getHorizontalPercent(context, 10),
                right: getHorizontalPercent(context, 10),
                bottom: getVerticalMargin(context),
                top: getVerticalMargin(context)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customDropButton,
                  Container(
                      height: getVerticalPercent(context, 53),
                      width: getHorizontalPercent(context, 80),
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: materialList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return materialList[index];
                          })),
                  Padding(
                      padding: EdgeInsets.all(getVerticalMargin(context)),
                      child: ElevatedButton(
                          onPressed: () {
                            if (isNotEmpty() &&
                                customDropButton.value != null) {
                              HomeBlocInheritedWidget.of(context)
                                  .homebloc
                                  .nameStation = customDropButton.value;
                              changePage(MaterialSolitude2(), context);
                            }
                          },
                          child: CustomText(data: "Continuar", size: 18)))
                ])));
  }

  //Verificar que existan materiales
  bool isNotEmpty() {
    for (int c = 0; c < materialList.length; c++) {
      if (materialList[c].counter > 0) return true;
    }
    return false;
  }
}
