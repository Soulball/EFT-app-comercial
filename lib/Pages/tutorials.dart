import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:flutter/material.dart';

//Pagina principal de la seccion para tutoriales
class Tutorials extends StatefulWidget {
  Tutorials({Key key}) : super(key: key);
  @override
  _TutorialsState createState() => _TutorialsState();
}

class _TutorialsState extends State<Tutorials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: CustomTextAppBar(data: 'Tutoriales')),
        body: Container(height: double.infinity, width: double.infinity));
  }
}