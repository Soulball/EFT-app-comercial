//Text con estilo de fuente personalizado
import 'dart:io';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class ImagePicker extends StatefulWidget {
  //Variables
  File image;

  //Constructor
  ImagePicker({this.image});

  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: showOptions,
        child: Container(
            height: getVerticalPercent(context, 25),
            width: getVerticalPercent(context, 25),
            color: blueLight,
            child: (widget.image != null)
                ? Image.file(
                    widget.image,
                    fit: BoxFit.fill,
                  )
                : IconButton(
                    icon: Icon(Icons.add_a_photo), onPressed: showOptions)));
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
                  pickImage(ImageSource.camera);
                  Navigator.pop(context);
                }),
            ListTile(
                title: Text('Galería'),
                leading: Icon(Icons.photo),
                onTap: () {
                  pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                })
          ]);
        });
  }

  void pickImage(ImageSource source) async {
    /*
    var pickImage = await ImagePicker.pickImage(source: source);
    setState(() {
      widget.image = pickImage;
    });
    */
  }
}
