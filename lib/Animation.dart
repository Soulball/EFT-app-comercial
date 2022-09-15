import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Utils.dart';

void onLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColors.Fondo,
                border: Border.all(
                    color: Colors.grey,
                    width: 2
                )
            ),
            height: 100,
            child: Center(
              child: Row(
                children:const [
                  Spacer(),
                  CircularProgressIndicator(),
                  SizedBox(width: 20,),
                  Text("Cargando",style: TextStyle(color: AppColors.PurpleBlue,fontWeight: FontWeight.bold,fontSize: 25),),
                  Spacer(),
                ],
              ),
            ),
          )
      );
    },
  );
}
void closeLoading(BuildContext context){
  Navigator.pop(context);
}

void showAnimation(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Stack(
        children: [
          Container(color: Colors.white.withOpacity(0.8)),
          Center(
            child: Image.asset(
              "assets/images/BlueLoader.gif",
              height: 140,
              width: 140,
            ),
          ),
        ],
      );
    },
  );
}

Widget loaderPage(){
  return Center(
    child: Image.asset(
      "assets/images/BlueLoader.gif",
      height: 100,
      width: 100,
    ),
  );
}