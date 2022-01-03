import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Classes/station.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextField.dart';
import 'package:eft_app_comercial/Widgets/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';

class MaterialSolitude2 extends StatelessWidget {
  MaterialSolitude2({Key key, this.station}) : super(key: key);
  final Station station;

  @override
  Widget build(BuildContext context) {
    CustomTextField customTextField = CustomTextField(
        lines: 10, title: "Descripción de materiales y medidas");
    return Scaffold(
        appBar: AppBar(
            title: CustomText(
                data: 'Solicitud de materiales',
                size: 22,
                color: whiteNeutral,
                weight: FontWeight.bold),
            backgroundColor: grayText),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(
                left: getHorizontalPercent(context, 10),
                right: getHorizontalPercent(context, 10),
                bottom: getVerticalMargin(context),
                top: getVerticalMargin(context)),
            child: ListView(physics: BouncingScrollPhysics(), children: [
              UserInfo(
                  user: HomeBlocInheritedWidget.of(context).homebloc.name,
                  station:
                      HomeBlocInheritedWidget.of(context).homebloc.nameStation),
              Card(
                  child: Container(
                      height: getVerticalPercent(context, 20),
                      child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: materialList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return (materialList[index].counter > 0)
                                ? Card(
                                    child: Padding(
                                        padding: EdgeInsets.all(
                                            getHorizontalMargin(context)),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              CustomText(
                                                  data:
                                                      materialList[index].item,
                                                  size: 24,
                                                  color: grayDark,
                                                  weight: FontWeight.bold),
                                              CustomText(
                                                  data: materialList[index]
                                                      .counter
                                                      .toString(),
                                                  size: 24,
                                                  color: grayDark,
                                                  weight: FontWeight.bold)
                                            ])))
                                : SizedBox(height: 1);
                          }))),
              Padding(
                  padding: EdgeInsets.only(
                      top: getVerticalPercent(context, 2.5),
                      bottom: getVerticalPercent(context, 2.5)),
                  child: customTextField),
              ElevatedButton(
                  onPressed: () {
                    if (customTextField.controller.text.length < 10) {
                      showDialogText(context, "Campo no valido",
                          "El comentario es demasiado corto.");
                      return;
                    }
                    uploadMaterialSolicitude(
                        HomeBlocInheritedWidget.of(context).homebloc.user,
                        station.number,
                        int.parse(getTurn()),
                        customTextField.controller.text);
                    backToOrigin(context);
                    showDialogText(context, "Nota",
                        "Operacion completada. Pendiente de revisión y aprobación.");
                  },
                  child: CustomText(data: "Enviar", size: 18))
            ])));
  }
}
