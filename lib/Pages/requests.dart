import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:flutter/material.dart';

//Pagina principal de la seccion para solicitudes
class Requests extends StatefulWidget {
  Requests({Key key}) : super(key: key);
  @override
  _RequestsState createState() => _RequestsState();
}

class _RequestsState extends State<Requests> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: CustomTextAppBar(data: 'Solicitudes')),
        body: Container(height: double.infinity, width: double.infinity));
  }
}