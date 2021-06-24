import 'package:flutter/cupertino.dart';

class HomeBloc extends ChangeNotifier {
  int user;
  int station;
  String name;
  BuildContext context;

  HomeBloc({this.user, this.station, this.name, this.context});
}
