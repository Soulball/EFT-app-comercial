// @dart=2.9

import 'package:eft_app_comercial/Bloc/Home/home_bloc.dart';
import 'package:flutter/widgets.dart';

class HomeBlocInheritedWidget extends InheritedWidget {
  final Widget child;
  final HomeBloc homebloc;

  HomeBlocInheritedWidget({this.child, this.homebloc});
  static HomeBlocInheritedWidget of(BuildContext context) => context.dependOnInheritedWidgetOfExactType();

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
