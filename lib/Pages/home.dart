// @dart=2.9
import 'package:motion_tab_bar_v2/motion-tab-bar.dart';
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

class _HomeState extends State<Home> with TickerProviderStateMixin{
  TabController _tabController;
  int pageIndex = 2;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 1,
      length: 5,
      vsync: this,
    );
  }
  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
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
            child: Scaffold(

              body: pagesList[pageIndex],

              bottomNavigationBar: MotionTabBar(
                initialSelectedTab: "Noticias",
                labels: const [
                  "Mercadotecnia",
                  "Tutoriales",
                  "Noticias",
                  "Otros productos",
                  "Comisiones"
                ],
                icons: const [
                  Icons.monetization_on_outlined,
                  Icons.library_books_outlined,
                  Icons.home,
                  Icons.message_outlined,
                  Icons.payment_outlined
                ],
                tabSize: 50,
                tabBarHeight: 55,
                textStyle: TextStyle(
                  fontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                tabIconColor: Colors.blue[600],
                tabIconSize: 28.0,
                tabIconSelectedSize: 26.0,
                tabSelectedColor: Colors.blue[900],
                tabIconSelectedColor: Colors.white,
                tabBarColor: Colors.white,
                onTabItemSelected: (int value) {
                  setState(() {
                    pageIndex = value;
                    _tabController.index = value;
                  }
                  );
                },
              ),
            )
        )
    );
  }
}