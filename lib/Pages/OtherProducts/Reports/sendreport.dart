import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/otherproduct.dart';
import 'package:eft_app_comercial/Widgets/customButton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextField.dart';
import 'package:eft_app_comercial/Widgets/userInfo.dart';
import 'package:flutter/material.dart';

class SendReport extends StatelessWidget {
  SendReport({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CustomText(
              data: 'Otros Productos',
              size: 30,
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
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            UserInfo(
                user:
                    (HomeBlocInheritedWidget.of(context).homebloc.name != null)
                        ? HomeBlocInheritedWidget.of(context).homebloc.name
                        : "Anonimo",
                station: "1221 - Hipodromo"),
            Card(
                child: Container(
                    height: getVerticalPercent(context, 20),
                    child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: productAceite.length,
                        itemBuilder: (BuildContext context, int index) {
                          return (productAceite[index].counter > 0)
                              ? Card(
                                  child: Padding(
                                      padding: EdgeInsets.all(
                                          getHorizontalMargin(context)),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            CustomText(
                                                data: productAceite[index].item,
                                                size: 24,
                                                color: grayDark,
                                                weight: FontWeight.bold),
                                            CustomText(
                                                data: productAceite[index]
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
                child: CustomTextField(
                    lines: 5, title: "Descripción de materiales y medidas")),
            CustomButton(
                text: "Enviar",
                noPop: false,
                page: OtherProduct(),
                pageContext: context)
          ],
        ),
      ),
    );
  }
}
