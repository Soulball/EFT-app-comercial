import 'package:eft_app_comercial/Bloc/Home/home_bloc.dart';
import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Menu principal con Navigation Bar
class Home extends StatefulWidget {
  Home({Key key, this.user, this.station, this.name}) : super(key: key);
  //Variables
  final user;
  final station;
  final name;

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
                        title: Text('Noticias')),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.monetization_on_outlined),
                        // ignore: deprecated_member_use
                        title: Text('Marcadotecnia')),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.library_books_outlined),
                        // ignore: deprecated_member_use
                        title: Text('Tutotiales')),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.message_outlined),
                        // ignore: deprecated_member_use
                        title: Text('Otros ingresos')),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.payment_outlined),
                        // ignore: deprecated_member_use
                        title: Text('Comisiones'))
                  ]),
              tabBuilder: (context, index) {
                return CupertinoTabView(builder: (context) {
                  return CupertinoPageScaffold(child: pagesList[index]);
                });
              })),
    );
  }
}
