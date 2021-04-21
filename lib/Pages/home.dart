import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Pages/commissions.dart';
import 'package:eft_app_comercial/Pages/requests.dart';
import 'package:eft_app_comercial/Pages/Tutorials/tutorials.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Tutorials/infos.dart';
import 'marketing.dart';
import 'News/news.dart';

//Menu principal con Navigation Bar
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Variables
  final List<Widget> _pagesList = [
    News(),
    Marketing(),
    Tutorials(),
    Requests(),
    Commissions(),
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
            backgroundColor: blueDark,
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
                  title: Text('Marketing')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_books_outlined),
                  // ignore: deprecated_member_use
                  title: Text('Tutotiales')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message_outlined),
                  // ignore: deprecated_member_use
                  title: Text('Solicitudes')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.payment_outlined),
                  // ignore: deprecated_member_use
                  title: Text('Comisiones'))
            ]),
        tabBuilder: (context, index) {
          return CupertinoTabView(builder: (context) {
            return CupertinoPageScaffold(child: _pagesList[index]);
          });
        });
  }
}