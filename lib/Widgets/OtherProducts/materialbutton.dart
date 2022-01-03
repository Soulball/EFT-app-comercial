import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/maxmin.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonAdjust extends StatefulWidget {
//variables
  Color picture;
  String select;
  int count = 0;
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
        color: widget.picture,
        border: Border.all(width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
          child: Text(widget.select),
          onTap: () {
            setState(() {
              switch (widget.count) {
                case 0:
                  widget.select = MaxMin.ChangeState[1];
                  widget.picture = Colors.blue;
                  _getMethod(widget.select);
                  widget.count++;
                  break;
                case 1:
                  widget.select = MaxMin.ChangeState[2];
                  widget.picture = Colors.red;
                  _getMethod(widget.select);
                  widget.count++;
                  break;
                case 2:
                  widget.select = MaxMin.ChangeState[0];
                  widget.picture = Colors.grey;
                  _getMethod(widget.select);
                  widget.count = 0;
                  break;
                default:
              }
            });
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
