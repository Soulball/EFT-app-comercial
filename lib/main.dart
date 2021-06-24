import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Reports/report.dart';
import 'package:flutter/material.dart';
import 'Pages/Login/login.dart';

//Inicio de la aplicacion
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: whiteDark),
        home: Report(),
        debugShowCheckedModeBanner: false);
  }
}
