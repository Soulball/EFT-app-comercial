<<<<<<< HEAD
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Pages/home.dart';
=======
>>>>>>> 691809869037aee36635e02b17490cf292f026e8
import 'package:flutter/material.dart';
import 'Libraries/decoration_colors.dart';
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
>>>>>>> 691809869037aee36635e02b17490cf292f026e8
        debugShowCheckedModeBanner: false);
  }
}
