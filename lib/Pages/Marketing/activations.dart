import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customDropbutton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Activations extends StatefulWidget {
  Activations({Key key}) : super(key: key);

  @override
  _ActivationsState createState() => _ActivationsState();
}

class _ActivationsState extends State<Activations> {
  @override
  Widget build(BuildContext context) {
    var stationCustomDropButton = CustomDropButton(
        title: "Seleccione la estación",
        initialValue: " Estación",
        list: stationList);
    var typeCustomDropButton = CustomDropButton(
        title: "Tipo de activación",
        initialValue: " Tipo de activación",
        list: activationType);
    var noteCustomTextField = CustomTextField(
        title: "Describe el proposito de la activación", lines: 10);
    return Scaffold(
        appBar: AppBar(
            title: CustomText(
                data: 'Solicitud de Tarjeta',
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
            child:
                ListView(physics: BouncingScrollPhysics(), children: <Widget>[
              stationCustomDropButton,
              SizedBox(height: getVerticalPercent(context, 4)),
              typeCustomDropButton,
              SizedBox(height: getVerticalPercent(context, 4)),
              noteCustomTextField,
              SizedBox(height: getVerticalPercent(context, 4)),
              ElevatedButton(
                  onPressed: () {
                    if (stationCustomDropButton.value == null) {
                      showDialogText(context, "Campo no valido",
                          "Seleccione una estación.");
                      return;
                    }
                    if (typeCustomDropButton.value == null) {
                      showDialogText(
                          context, "Campo no valido", "Seleccione un tipo.");
                      return;
                    }
                    if (noteCustomTextField.controller.text.length < 10) {
                      showDialogText(context, "Campo no valido",
                          "El comentario es demasiado corto.");
                      return;
                    }
                    backToOrigin(context);
                    showDialogText(context, "Nota",
                        "Operacion completada. Pendiente de revisión y aprovación.");
                  },
                  child: CustomText(data: "Continuar", size: 18))
            ])));
  }
}
