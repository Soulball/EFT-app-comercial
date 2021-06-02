import 'package:eft_app_comercial/Classes/user.dart';
import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

final _keyvalidate = GlobalKey<FormState>();

class LoginForm extends StatefulWidget {
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final user = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    user.dispose();
    password.dispose();
    super.dispose();
  }

  Future<User> fetchPost({String user, String password}) async {
    var response = await http.get(Uri.parse(
        "http://192.168.209.119:60000/client?username=$user&password=$password"));
    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    } else {
      print('invalido');
    }
  }

  void loginMethod() async {
    if (user.text.length > 0) {
      if (password.text.length > 0) {
        fetchPost(user: user.text, password: password.text);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: getHorizontalPercent(context, 1),
      height: getVerticalPercent(context, 43),
      child: Form(
        key: _keyvalidate,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: getHorizontalPercent(context, 0.012),
              height: getVerticalPercent(context, 10),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey[200], width: 2),
              ),
              child: TextFormField(
                controller: user,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                autofocus: true,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  hintText: "Usuario",
                  prefixIcon: Icon(
                    Icons.email,
                    color: blueLight, //#31BEE8
                  ),
                ),
              ),
            ),
            SizedBox(height: getVerticalPercent(context, 2.8)),
            Container(
              alignment: Alignment.topCenter,
              width: getHorizontalPercent(context, 0.012),
              height: getVerticalPercent(context, 10),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey[200],
                  width: 2,
                ),
              ),
              child: TextFormField(
                controller: password,
                keyboardType: TextInputType.numberWithOptions(decimal: false),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                autofocus: true,
                textAlign: TextAlign.center,
                obscureText: true,
                style: TextStyle(
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  hintText: "Contraseña",
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: blueLight,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getVerticalPercent(context, 10),
            ),
            MaterialButton(
              autofocus: true,
              color: blueLight,
              height: getVerticalPercent(context, 9),
              minWidth: getHorizontalPercent(context, 0.012),
              shape: StadiumBorder(),
              child: Text(
                'Entrar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getVerticalPercent(context, 3.0),
                ),
              ),
              onPressed: loginMethod,
            ),
          ],
        ),
      ),
    );
  }
}
