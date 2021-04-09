import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:flutter/material.dart';

//Pagina principal de la seccion para comisiones
class Commissions extends StatefulWidget {
  Commissions({Key key}) : super(key: key);
  @override
  _CommissionsState createState() => _CommissionsState();
}

class _CommissionsState extends State<Commissions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: CustomTextAppBar(data: 'Comisiones')),
        body: Container(height: double.infinity, width: double.infinity));
  }
}