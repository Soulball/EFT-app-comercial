import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:flutter/material.dart';
import 'Pages/Login/login.dart';
import 'Pages/home.dart';

//Inicio de la aplicacion
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: whiteDark),
        home: Home(),
        debugShowCheckedModeBanner: false);
  }
}
