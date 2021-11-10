import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/maxmin.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonAdjust extends StatefulWidget {
//variables
  Color picture;
  String select;
  int count;
  int type;

//Constructor
  ButtonAdjust({this.picture, this.select, this.count, this.type});

  @override
  _ButtonAdjustState createState() => _ButtonAdjustState();
}

class _ButtonAdjustState extends State<ButtonAdjust> {
  @override
  Widget build(BuildContext context) {
    getChange();
    return Container(
      decoration: BoxDecoration(
        color: picture,
        border: Border.all(width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
          child: Text(select),
          onTap: () {
            switch (count) {
              case 0:
                setState(() {
                  select = MaxMin.ChangeState[1];
                  picture = Colors.blue;
                  _getMethod(select);
                });
                count++;
                break;
              case 1:
                setState(() {
                  select = MaxMin.ChangeState[2];
                  picture = Colors.red;
                  _getMethod(select);
                });
                count++;
                break;
              case 2:
                setState(() {
                  select = MaxMin.ChangeState[0];
                  picture = Colors.grey;
                  _getMethod(select);
                });
                count = 0;
                break;
              default:
            }
          }),
    );
  }

  int _getMethod(String type) {
    for (int c = 0; c < MaxMin.ChangeState.length; c++) {
      if (type == MaxMin.ChangeState[c]) {
        return MaxMin.ChangeStateClass[c].type;
      }
    }
    return 0;
  }
}
