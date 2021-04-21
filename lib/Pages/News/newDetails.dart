import 'package:eft_app_comercial/Classes/new.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:flutter/material.dart';

//Pagina principal de la seccion de marketing
class NewDetails extends StatelessWidget {
  NewDetails({Key key, this.newId}) : super(key: key);
  final New newId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: CustomTextAppBar(data: 'Detalles')),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: ListView(children: <Widget>[
              Container(
                height: 40,
              ),
              Container(
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(newId.image),
                          fit: BoxFit.cover))),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: CustomText(
                    data: newId.name,
                    size: 24,
                    color: grayDark,
                    weight: FontWeight.bold),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, bottom: 15),
                  child: CustomText(
                      data: newId.text, size: 14, color: grayDark))
            ])));
  }
}
