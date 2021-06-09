import 'package:flutter/cupertino.dart';

class HomeBloc extends ChangeNotifier {
  int user;
  int station;
  String name;

  HomeBloc({this.user, this.station, this.name});
}
