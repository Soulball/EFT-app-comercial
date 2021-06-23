import 'package:eft_app_comercial/Bloc/Home/inheritedwidget.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Widgets/customText.dart';
import 'package:flutter/material.dart';

class ShowUsers extends StatefulWidget {
  ShowUsers({Key key}) : super(key: key);

  @override
  _ShowUsersState createState() => _ShowUsersState();
}

class _ShowUsersState extends State<ShowUsers> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      color: whiteDark,
      height: getVerticalPercent(context, 8),
      width: getHorizontalPercent(context, 90),
      alignment: Alignment.centerLeft,
      child: CustomText(
        data: 'Colaborador | ' +
            HomeBlocInheritedWidget.of(context).homebloc.name,
        color: grayDark,
        size: getVerticalPercent(context, 4),
        weight: FontWeight.normal,
      ),
    );
  }
}
