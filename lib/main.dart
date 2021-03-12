import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'Pages/home.dart';

//Inicio de la aplicacion
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}