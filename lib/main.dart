import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
<<<<<<< HEAD
import 'package:eft_app_comercial/Pages/home.dart';
=======
>>>>>>> 6e6f9171cd01c10c159e1faae49dbe5c96643140
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
        home: Login(),
>>>>>>> 6e6f9171cd01c10c159e1faae49dbe5c96643140
        debugShowCheckedModeBanner: false);
  }
}
