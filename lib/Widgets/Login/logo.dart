import 'package:flutter/material.dart';

import 'icon.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      bottom: size.height * -0.08,
      width: size.width * 1,
      child: Column(
        children: <Widget>[
          Center(
            child: IconContainer(
              size: size.height * 0.18,
            ),
          ),
        ],
      ),
    );
  }
}
