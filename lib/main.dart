import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Reports/requestreport.dart';
import 'package:eft_app_comercial/Pages/home.dart';
import 'package:flutter/material.dart';
import 'Libraries/decoration_colors.dart';
import 'Pages/Login/login.dart';
import 'Pages/OtherProducts/Reports/report.dart';

//Inicio de la aplicacion
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: whiteDark),
        home: Login(),
        debugShowCheckedModeBanner: false);
  }
}
