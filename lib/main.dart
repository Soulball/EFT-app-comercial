import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
<<<<<<< HEAD
import 'package:eft_app_comercial/Pages/home.dart';
=======
import 'package:eft_app_comercial/Pages/OtherProducts/avanceventas.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/otherproduct.dart';
>>>>>>> 823ec4dc2d06c3aa8626ead34a033ae6ed2b260d
import 'package:flutter/material.dart';
import 'Pages/Login/login.dart';

//Inicio de la aplicacion
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: whiteDark),
<<<<<<< HEAD
        home: Home(),
=======
        home: OtherProduct(),
>>>>>>> 823ec4dc2d06c3aa8626ead34a033ae6ed2b260d
        debugShowCheckedModeBanner: false);
  }
}
