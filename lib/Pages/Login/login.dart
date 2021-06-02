import 'package:eft_app_comercial/Widgets/Login/header.dart';
import 'package:eft_app_comercial/Widgets/Login/loginform.dart';
import 'package:eft_app_comercial/Widgets/Login/logo.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        color: Colors.transparent,
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.only(top: 0),
          physics: BouncingScrollPhysics(),
          children: [
            Stack(
              // ignore: deprecated_member_use
              overflow: Overflow.visible,
              alignment: Alignment.bottomCenter,
              children: [
                HeaderLogin(),
                Logo(),
              ],
              // ignore: deprecated_member_use
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
