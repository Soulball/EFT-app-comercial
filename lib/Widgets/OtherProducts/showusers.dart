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
      color: whiteDark,
      height: getVerticalPercent(context, 12),
      width: getHorizontalPercent(context, 90),
      alignment: Alignment.centerLeft,
      child: CustomText(
        data: 'Colaborador | Fanny Paola',
        color: grayDark,
        size: getVerticalPercent(context, 4.2),
        weight: FontWeight.normal,
      ),
    );
  }
}
