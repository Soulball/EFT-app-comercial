// @dart=2.9

import 'package:flutter/cupertino.dart';

class HomeBloc extends ChangeNotifier {
  int user;
  int station;
  String name;
  String nameStation;
  BuildContext context;

  HomeBloc(
      {this.user, this.station, this.name, this.context, this.nameStation});
}
