import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/Marketing/marketing.dart';
import 'package:eft_app_comercial/Widgets/customSearchDropButton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/itemCounter.dart';
import 'package:eft_app_comercial/Widgets/userInfo.dart';
import 'package:flutter/material.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';

class CardBlock1 extends StatefulWidget {
  CardBlock1({Key key}) : super(key: key);

  @override
  _CardBlock1State createState() => _CardBlock1State();
}

class _CardBlock1State extends State<CardBlock1> {
  //Variables
  var customSearchDropButton = CustomSearchDropButton(
      name: "Estación",
      defaultValue: "Seleccione la estación",
      search: true,
      items: Marketing.allStationList);
  var itemCounter = ItemCounter(item: "Bloque de tarjetas");
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserInfo(
                      user: HomeBlocInheritedWidget.of(context).homebloc.name,
                      station: HomeBlocInheritedWidget.of(context)
                          .homebloc
                          .nameStation),
                  customSearchDropButton,
                  Container(
                    width: getHorizontalPercent(context, 80),
                    child: itemCounter,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (itemCounter.counter == 0) {
                          showDialogText(context, "Cantidad no valida",
                              "La cantidad de solicitar debe ser mayor que 0.");
                          return;
                        }
                        if (customSearchDropButton.selectedItem == null) {
                          showDialogText(context, "Campo no valido",
                              "Seleccione una estación.");
                          return;
                        }
                        uploadCardBlock(
                            HomeBlocInheritedWidget.of(context).homebloc.user,
                            Marketing
                                .allStationListClass[Marketing.allStationList
                                    .indexOf(
                                        customSearchDropButton.selectedItem)]
                                .number,
                            itemCounter.counter,
                            int.parse(getTurn()));
                        backToOrigin(context);
                        showDialogText(context, "Nota",
                            "Operacion completada. Pendiente de revisión y aprovación.");
                      },
                      child: CustomText(data: "Enviar", size: 18))
                ])));
  }
}
