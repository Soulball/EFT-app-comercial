library media;
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/Login/login.dart';
import 'package:eft_app_comercial/Pages/Marketing/marketing.dart';
import 'package:eft_app_comercial/Pages/News/news.dart';
import 'package:eft_app_comercial/Pages/Tutorials/tutorials.dart';
import 'package:eft_app_comercial/Pages/commissions.dart';
import 'package:eft_app_comercial/Pages/requests.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/itemCounter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'decoration_colors.dart';

//Lista de modulos prinicpales
final List<Widget> pagesList = [
  News(),
  Marketing(),
  Tutorials(),
  Requests(),
  Commissions()
];

final List stationList = [
  " 1221 - Hipódromo",
  " 1221 - Washmobile",
  " 1221 - Rio",
  " 1221 - Clínica 27",
  " 1221 - La mesa"
];

final List activationType = [
  " Estrategia de Precio",
  " Otros productos",
  " Generación de tráfico"
];

List<ItemCounter> materialList = [
  ItemCounter(item: "Lona"),
  ItemCounter(item: "Bandera"),
  ItemCounter(item: "Bandera de mano"),
  ItemCounter(item: "Promocionales"),
  ItemCounter(item: "Activaciones"),
  ItemCounter(item: "Coroplast"),
  ItemCounter(item: "Otro")
];

List<ItemCounter> cardBlockItemCounter = [
  ItemCounter(item: "Bloque de tarjetas")
];

//Abrir URL con la aplicacion
Future<void> openURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se ha podido cargar el enlace.';
  }
}

//Mover a otro modulo
void changePage(Widget page, BuildContext pageContext) {
  final route = MaterialPageRoute(builder: (BuildContext context) {
    return page;
  });
  Navigator.of(pageContext).push(route);
}

//Regresar al modulo principal
void backToOrigin(BuildContext pageContext) {
  if (Navigator.of(pageContext).canPop()) {
    Navigator.pop(pageContext);
    backToOrigin(pageContext);
  }
}

String getTurn() {
  DateTime dateTime = DateTime.now();
  String turn = "1";
  if (dateTime.hour > 13) turn = "2";
  return turn;
}

//Mostrar un dialog Text
void showDialogText(BuildContext context, String title, String text) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
            title: Text(title),
            backgroundColor: graySubtitle,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            children: [
              Padding(
                  padding: EdgeInsets.all(getVerticalMargin(context)),
                  child: CustomText(data: text, size: 14, color: grayDark))
            ]);
      });
}

//Cargar usuario
void setLogedUser(int user, int station, String name) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('user', user);
  prefs.setInt('station', station);
  prefs.setString('name', name);
  print('insertados');
}

//Revisar usuario
Future<void> getLogedUser() async {
  final prefs = await SharedPreferences.getInstance();
  int user = prefs.getInt('user');
  Login.user = user;
  final prefs2 = await SharedPreferences.getInstance();
  int station = prefs2.getInt('station');
  Login.station = station;
  final prefs3 = await SharedPreferences.getInstance();
  String name = prefs3.getString('name');
  Login.name = name;
}

//Borrar usuario y estacion
void deleteUser() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user', null);
  await prefs.setString('station', null);
  await prefs.setString('name', null);
}
