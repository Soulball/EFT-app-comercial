import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ButtonDescription extends StatelessWidget {
  Widget page;
  BuildContext pageContext;

  ButtonDescription({this.page, this.pageContext});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        color: Colors.black38, // button color
        child: InkWell(
          onTap: () {
            changePage(page, pageContext);
          },
          // inkwell color
          child: SizedBox(
            height: double.infinity,
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black54,
              size: getVerticalPercent(context, 4),
            ),
          ),
        ),
      ),
    );
  }
}
