import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Reports/report.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/otherproduct.dart';
import 'package:eft_app_comercial/Widgets/customButton.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextField.dart';
import 'package:eft_app_comercial/Widgets/userInfo.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SendReport extends StatefulWidget {
  // ignore: deprecated_member_use
  int data;
  SendReport({Key key, this.data}) : super(key: key);

  @override
  _SendReportState createState() => _SendReportState();
}

class _SendReportState extends State<SendReport> {
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
              child: _mSelectd(widget.data),
            ),
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

  Widget _mSelectd(data) {
    print(data);
    switch (data) {
      case 1:
        return _mAceite();
        break;
      case 2:
        return _mCiel();
        break;
      case 3:
        return _mToros();
        break;
      case 4:
        return _mGas();
        break;
      case 5:
        return _mAromas();
        break;
      default:
    }
    return Container(
      child: Text("Hola"),
    );
  }

  Widget _mAceite() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              data: "Exhibidores: ",
              size: 20,
              weight: FontWeight.bold,
            ),
            CustomText(
              data: "Aceite",
              size: 20,
              weight: FontWeight.bold,
            )
          ],
        ),
        Container(
          height: getVerticalPercent(context, 20),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: exhibitoraceite.length,
            itemBuilder: (BuildContext context, int index) {
              return (exhibitoraceite[index].counter > 0)
                  ? Card(
                      child: Padding(
                          padding: EdgeInsets.all(getHorizontalMargin(context)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                CustomText(
                                    data: exhibitoraceite[index].item,
                                    size: 20,
                                    color: grayDark,
                                    weight: FontWeight.normal),
                                CustomText(
                                    data: exhibitoraceite[index]
                                        .counter
                                        .toString(),
                                    size: 24,
                                    color: grayDark,
                                    weight: FontWeight.normal)
                              ])))
                  : SizedBox(height: 1);
            },
          ),
        ),
      ],
    );
  }

  Widget _mCiel() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              data: "Exhibidores: ",
              size: 20,
              weight: FontWeight.bold,
            ),
            CustomText(
              data: "Ciel",
              size: 20,
              weight: FontWeight.bold,
            )
          ],
        ),
        Container(
          height: getVerticalPercent(context, 20),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: exhibitorciel.length,
            itemBuilder: (BuildContext context, int index) {
              return (exhibitorciel[index].select2 == true)
                  ? Card(
                      child: Padding(
                        padding: EdgeInsets.all(getHorizontalMargin(context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CustomText(
                                data: Report.CExhibitorString[index],
                                size: 20,
                                color: grayDark,
                                weight: FontWeight.normal),
                          ],
                        ),
                      ),
                    )
                  : Container();
            },
          ),
        ),
      ],
    );
  }

  _mToros() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              data: "Exhibidores: ",
              size: 20,
              weight: FontWeight.bold,
            ),
            CustomText(
              data: "Ciel",
              size: 20,
              weight: FontWeight.bold,
            )
          ],
        ),
        Container(
          height: getVerticalPercent(context, 20),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: exhibitorciel.length,
            itemBuilder: (BuildContext context, int index) {
              return (exhibitorciel[index].select2 == true)
                  ? Card(
                      child: Padding(
                        padding: EdgeInsets.all(getHorizontalMargin(context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CustomText(
                                data: Report.CExhibitorString[index],
                                size: 20,
                                color: grayDark,
                                weight: FontWeight.normal),
                          ],
                        ),
                      ),
                    )
                  : Container();
            },
          ),
        ),
      ],
    );
  }

  _mGas() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              data: "Exhibidores: ",
              size: 20,
              weight: FontWeight.bold,
            ),
            CustomText(
              data: "Ciel",
              size: 20,
              weight: FontWeight.bold,
            )
          ],
        ),
        Container(
          height: getVerticalPercent(context, 20),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: exhibitorciel.length,
            itemBuilder: (BuildContext context, int index) {
              return (exhibitorciel[index].select2 == true)
                  ? Card(
                      child: Padding(
                        padding: EdgeInsets.all(getHorizontalMargin(context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CustomText(
                                data: Report.CExhibitorString[index],
                                size: 20,
                                color: grayDark,
                                weight: FontWeight.normal),
                          ],
                        ),
                      ),
                    )
                  : Container();
            },
          ),
        ),
      ],
    );
  }

  _mAromas() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              data: "Exhibidores: ",
              size: 20,
              weight: FontWeight.bold,
            ),
            CustomText(
              data: "Ciel",
              size: 20,
              weight: FontWeight.bold,
            )
          ],
        ),
        Container(
          height: getVerticalPercent(context, 20),
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: exhibitorciel.length,
            itemBuilder: (BuildContext context, int index) {
              return (exhibitorciel[index].select2 == true)
                  ? Card(
                      child: Padding(
                        padding: EdgeInsets.all(getHorizontalMargin(context)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CustomText(
                                data: Report.CExhibitorString[index],
                                size: 20,
                                color: grayDark,
                                weight: FontWeight.normal),
                          ],
                        ),
                      ),
                    )
                  : Container();
            },
          ),
        ),
      ],
    );
  }
}
