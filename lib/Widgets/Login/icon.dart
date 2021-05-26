import 'package:flutter/material.dart';

class IconContainer extends StatelessWidget {
  final double size;

  const IconContainer({Key key, @required this.size})
      : assert(size != null && size > 0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      height: this.size,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(this.size * 0.32),
        border: Border.all(
          color: Colors.white10,
          width: 5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 20,
          )
        ],
      ),
      child: Center(
        child: CircleAvatar(
          radius: size * 0.5,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.account_circle_outlined,
            size: size * 0.65,
            color: Color.fromRGBO(49, 190, 232, 1),
          ),
        ),
      ),
    );
  }
}
