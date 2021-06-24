import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';

class ButtonSend extends StatelessWidget {
  String text;
  Widget page;

  ButtonSend({this.text, this.page});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getVerticalMargin(context)),
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text('Hola!'),
        onPressed: () {},
      ),
    );
  }
}
