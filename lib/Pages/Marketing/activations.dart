import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/Marketing/marketing.dart';
import 'package:eft_app_comercial/Widgets/customSearchDropButton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';

class Activations extends StatefulWidget {
  Activations({Key key}) : super(key: key);

  @override
  _ActivationsState createState() => _ActivationsState();
}

class _ActivationsState extends State<Activations> {
  @override
  Widget build(BuildContext context) {
    //Variables
    var stationCustomSearchDropButton = CustomSearchDropButton(
        name: "Estación",
        defaultValue: "Seleccione la estación",
        search: true,
        items: Marketing.allStationList);
    var typeCustomSearchDropButton = CustomSearchDropButton(
        name: "Tipo de activación",
        defaultValue: "Seleccione un tipo de activación",
        search: false,
        items: activationType);
    var noteCustomTextField = CustomTextField(
        title: "Describe el proposito de la activación", lines: 10);
    return Scaffold(
        appBar: AppBar(
            title: CustomText(
                data: 'Solicitud de Tarjeta',
                size: 22,
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
            child:
                ListView(physics: BouncingScrollPhysics(), children: <Widget>[
              stationCustomSearchDropButton,
              SizedBox(height: getVerticalPercent(context, 4)),
              typeCustomSearchDropButton,
              SizedBox(height: getVerticalPercent(context, 4)),
              noteCustomTextField,
              SizedBox(height: getVerticalPercent(context, 4)),
              ElevatedButton(
                  onPressed: () {
                    if (stationCustomSearchDropButton.selectedItem == null) {
                      showDialogText(context, "Campo no valido",
                          "Seleccione una estación.");
                      return;
                    }
                    if (typeCustomSearchDropButton.selectedItem == null) {
                      showDialogText(
                          context, "Campo no valido", "Seleccione un tipo.");
                      return;
                    }
                    if (noteCustomTextField.controller.text.length < 10) {
                      showDialogText(context, "Campo no valido",
                          "El comentario es demasiado corto.");
                      return;
                    }
                    uploadActivation(
                        HomeBlocInheritedWidget.of(context).homebloc.user,
                        Marketing
                            .allStationListClass[Marketing.allStationList
                                .indexOf(
                                    stationCustomSearchDropButton.selectedItem)]
                            .number,
                        typeCustomSearchDropButton.selectedItem,
                        noteCustomTextField.controller.text);
                    backToOrigin(context);
                    showDialogText(context, "Nota",
                        "Operacion completada. Pendiente de revisión y aprobación.");
                  },
                  child: CustomText(data: "Continuar", size: 18))
            ])));
  }
}
