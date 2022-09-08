// @dart=2.9

import 'package:eft_app_comercial/Bloc/Home/home_bloc.dart';
import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Menu principal con Navigation Bar
class Home extends StatefulWidget {
  Home({Key key, this.user, this.station, this.name, this.nameStation})
      : super(key: key);
  //Variables
  final user;
  final station;
  final name;
  final nameStation;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //Homeblock
    HomeBloc homeBloc = new HomeBloc(
        user: widget.user,
        station: widget.station,
        name: widget.name,
        nameStation: widget.nameStation,
        context: context);
    return WillPopScope(
        onWillPop: () async => false,
        child: HomeBlocInheritedWidget(
            homebloc: homeBloc,
            child: CupertinoTabScaffold(
                tabBar: CupertinoTabBar(
                    backgroundColor: blueNeutral,
                    activeColor: blueLight,
                    inactiveColor: grayLight,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                          icon: Icon(Icons.home_outlined),
                          // ignore: deprecated_member_use
                          label: ('Noticias')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.monetization_on_outlined),
                          // ignore: deprecated_member_use
                          label: ('Marcadotecnia')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.library_books_outlined),
                          // ignore: deprecated_member_use
                          label: ('Tutotiales')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.message_outlined),
                          // ignore: deprecated_member_use
                          label: ('Otros ingresos')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.payment_outlined),
                          // ignore: deprecated_member_use
                          label: ('Comisiones'))
                    ]),
                tabBuilder: (context, index) {
                  return CupertinoTabView(builder: (context) {
                    return CupertinoPageScaffold(child: pagesList[index]);
                  });
                })));
  }
}
