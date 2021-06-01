import 'package:flutter/cupertino.dart';

class HomeBloc extends ChangeNotifier {
  String user;
  int station;

  HomeBloc({this.user, this.station});
}
