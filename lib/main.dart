import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/otherproduct.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/prueba.dart';
import 'package:flutter/material.dart';
import 'Pages/Login/login.dart';
import 'Widgets/OtherProducts/datetable.dart';

//Inicio de la aplicacion
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: whiteDark),
        //home: DateT(),
        //home: MyHomePage(title: 'Flutter Demo Home Page'),
        home: Login(),
        debugShowCheckedModeBanner: false);
  }
}
