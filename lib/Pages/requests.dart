// @dart=2.9

import 'dart:io';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//Pagina principal de la seccion para solicitudes
class Requests extends StatefulWidget {
  Requests({Key key}) : super(key: key);
  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  File image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: CustomTextAppBar(data: 'Solicitudes')),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(getVerticalMargin(context)),
            child: InkWell(
                onTap: showOptions,
                child: Container(
                    height: getVerticalPercent(context, 25),
                    width: getVerticalPercent(context, 25),
                    color: blueLight,
                    child: (image != null)
                        ? Image.file(
                            image,
                            fit: BoxFit.fill,
                          )
                        : IconButton(
                            icon: Icon(Icons.add_a_photo),
                            onPressed: showOptions)))));
  }

  void showOptions() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(children: <Widget>[
            ListTile(
                title: Text('Camara'),
                leading: Icon(Icons.camera),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.pop(context);
                }),
            ListTile(
                title: Text('Galería'),
                leading: Icon(Icons.photo),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.pop(context);
                })
          ]);
        });
  }

  void getImage(ImageSource source) {
    // ignore: deprecated_member_use, invalid_use_of_visible_for_testing_member
    var pickImage = ImagePicker.platform;
    setState(() {
      image = pickImage as File;
    });
  }
}
