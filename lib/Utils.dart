import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils extends StatefulWidget {
  const Utils({Key? key}) : super(key: key);

  @override

  State<Utils> createState() => _UtilsState();
}

class _UtilsState extends State<Utils> {

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double getScreenWith(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

class AppColors {

  AppColors._();
  static const Color PurpleBlue = Color(0xFF0C14A4);
  static const Color PrettyBlue = Color(0xFF1f68a4);
  static const Color Fondo = Color(0xFFf4f4f4);
}

String ip = "http://10.255.247.111:5698";

displayMessage({required BuildContext context,required String title, required String message}){
  showCupertinoDialog(
    context: context,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          CupertinoDialogAction(
              child: Text("OK"),
              onPressed: (){
                Navigator.of(context).pop();
              }
          )
        ],
      );
    },
  );
}