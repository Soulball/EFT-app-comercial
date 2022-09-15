// @dart=2.9

library media;

import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Pages/Login/login.dart';
import 'package:eft_app_comercial/Pages/Marketing/marketing.dart';
import 'package:eft_app_comercial/Pages/News/news.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Reports/report.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/otherproduct.dart';
import 'package:eft_app_comercial/Pages/Tutorials/tutorials.dart';
import 'package:eft_app_comercial/Pages/commissions.dart';
import 'package:eft_app_comercial/Pages/stationSearch.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/customchecklist.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:eft_app_comercial/Widgets/itemCounter.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'decoration_colors.dart';

//Lista de modulos prinicpales
final List<Widget> pagesList = [
  Marketing(),
  Tutorials(),
  News(),
  OtherProduct(),
  Commissions()
];

final List stationList = [
  " 1221 - Hipódromo",
  " 1221 - Washmobile",
  " 1221 - Rio",
  " 1221 - Clínica 27",
  " 1221 - La mesa"
];

final List<String> registerType = ["Registrar cliente", "Reposición"];

final List<String> activationType = [
  " Estrategia de Precio",
  " Otros productos",
  " Generación de tráfico"
];

final List exhibidores = [
  "Aceites",
  "Ciel",
  "Toros",
  "Gas",
  "Aromas/Wipers",
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

// Envia la lista de los componentes de los exhibidores de aceites
List<ItemCounter> exhibitoraceite = [
  ItemCounter(item: Report.CExhibitorString[0]),
  ItemCounter(item: Report.CExhibitorString[1])
];
// Envia la lista de los componentes de los exhibidores de ciel
List<CustomCheckList> exhibitorciel = [
  CustomCheckList(text: Text(Report.CExhibitorString[0])),
  CustomCheckList(text: Text(Report.CExhibitorString[1])),
  CustomCheckList(text: Text(Report.CExhibitorString[2])),
];

List<ItemCounter> cardBlockItemCounter = [
  ItemCounter(item: "Bloque de tarjetas")
];

//Abrir URL con la aplicacion
Future<void> openURL(String url) async {
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
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

//Mover a otro modulo y borrar historial
void changePageDrop(Widget page, BuildContext pageContext) {
  Navigator.of(pageContext).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => page),
      (Route<dynamic> route) => false);
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

Widget getDrawer(BuildContext context) {
  return Drawer(
      child: ListView(children: <Widget>[
    DrawerHeader(
        decoration: BoxDecoration(color: grayDark),
        child: UserAccountsDrawerHeader(
            accountEmail: Text(
                HomeBlocInheritedWidget.of(context).homebloc.name +
                    "@gmail.com"),
            accountName:
                Text(HomeBlocInheritedWidget.of(context).homebloc.name),
            currentAccountPicture:
                Icon(Icons.supervised_user_circle_rounded, size: 50))),
    ListTile(
        title: Text("Estaciones"),
        leading: Icon(Icons.ev_station_outlined),
        onTap: () {
          changePage(
              StationSearcher(
                  homebloc: HomeBlocInheritedWidget.of(context).homebloc),
              HomeBlocInheritedWidget.of(context).homebloc.context);
        }),
    ListTile(
        title: Text("Cerrar sesión"),
        leading: Icon(Icons.exit_to_app_rounded),
        onTap: () {
          deleteUser();
          changePageDrop(
              Login(), HomeBlocInheritedWidget.of(context).homebloc.context);
        })
  ]));
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
                  child: CustomText(data: text, size: 14, color: grayDark)),
              IconButton(
                  icon: Icon(Icons.close),
                  iconSize: 40,
                  splashRadius: 25,
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ]);
      });
}

//Cargar usuario
void setLogedUser(
    int user, int station, String name, String nameStation) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('user', user);
  prefs.setInt('station', station);
  prefs.setString('name', name);
  prefs.setString('namestation', nameStation);
  defaultStation = station;
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
  defaultStation = station;
  String name = prefs3.getString('name');
  Login.name = name;
  final prefs4 = await SharedPreferences.getInstance();
  String nameStation = prefs4.getString('namestation');
  Login.nameStation = nameStation;
}

void setStation(int station, String nameStation) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('station', station);
  defaultStation = station;
  await prefs.setString('namestation', nameStation);
}

//Borrar usuario y estacion
void deleteUser() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('user', null);
  await prefs.setInt('station', null);
  await prefs.setString('name', null);
  await prefs.setString('namestation', null);
}

int defaultStation = 9999;
