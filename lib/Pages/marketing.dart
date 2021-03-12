import 'package:flutter/material.dart';

//Pagina principal de la seccion de marketing
class Marketing extends StatefulWidget {
  Marketing({Key key}) : super(key: key);
  @override
  _MarketingState createState() => _MarketingState();
}

class _MarketingState extends State<Marketing> {
  Color color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: color,
        child: FlatButton(
            onPressed: () {
              setState(() {
                if (color == Colors.white)
                  color = Colors.blue;
                else
                  color = Colors.white;
              });
            },
            child: Text('Cambiar')),
      ),
    );
  }
}
