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
      color: Colors.blue,
      height: getVerticalPercent(context, 10),
      alignment: Alignment.centerLeft,
      child: CustomText(
        data: ' Colaborador | Alejandro Hernadez ',
        size: 24,
        color: grayDark,
        weight: FontWeight.normal,
      ),
    );
  }
}
