// @dart=2.9

import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Pages/Login/login.dart';
import 'package:flutter/material.dart';

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
