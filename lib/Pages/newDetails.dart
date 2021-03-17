import 'package:eft_app_comercial/Widgets/customTextAppBar.dart';
import 'package:flutter/material.dart';

//Pagina principal de la seccion de marketing
class NewDetails extends StatefulWidget {
  NewDetails({Key key}) : super(key: key);

  @override
  _NewDetailsState createState() => _NewDetailsState();
}

class _NewDetailsState extends State<NewDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: CustomTextAppBar(data: 'Detalles')),
      body: Container(height: double.infinity, width: double.infinity),
    );
  }
}
