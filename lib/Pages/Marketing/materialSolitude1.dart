import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/Marketing/marketing.dart';
import 'package:eft_app_comercial/Pages/Marketing/materialSolitude2.dart';
import 'package:eft_app_comercial/Widgets/customSearchDropButton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class MaterialSolitude1 extends StatefulWidget {
  MaterialSolitude1({Key key}) : super(key: key);

  @override
  _MaterialSolitude1State createState() => _MaterialSolitude1State();
}

class _MaterialSolitude1State extends State<MaterialSolitude1> {
  //Variables
  CustomSearchDropButton customSearchDropButton = CustomSearchDropButton(
      name: "Estación",
      defaultValue: "Seleccione una estación",
      search: true,
      items: Marketing.allStationList);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: CustomText(
                data: 'Solicitud de materiales',
                size: 30,
                color: whiteNeutral,
                weight: FontWeight.bold),
            backgroundColor: grayNeutral),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            padding: EdgeInsets.only(
                left: getHorizontalPercent(context, 5),
                right: getHorizontalPercent(context, 5),
                bottom: getVerticalMargin(context),
                top: getVerticalMargin(context)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  customSearchDropButton,
                  Container(
                      height: getVerticalPercent(context, 53),
                      width: getHorizontalPercent(context, 85),
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
                            if (!isNotEmpty()) {
                              showDialogText(context, "No hay materiales",
                                  "Debe haber un minimo de un material con un valor mayor a 0 para realizar una solicitud.");
                              return;
                            }
                            if (customSearchDropButton.selectedItem == null) {
                              showDialogText(context, "Campo no valido",
                                  "Seleccione una estación.");
                              return;
                            }
                            changePage(
                                MaterialSolitude2(
                                    station: Marketing.allStationListClass[
                                        Marketing.allStationList.indexOf(
                                            customSearchDropButton
                                                .selectedItem)]),
                                context);
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
