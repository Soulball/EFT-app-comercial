import 'package:eft_app_comercial/Classes/user.dart';
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
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.43,
      child: Form(
        key: _keyvalidate,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height * 0.1,
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Colors.transparent,
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
                    color: Color.fromRGBO(49, 190, 232, 1),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .028,
            ),
            Container(
              alignment: Alignment.topCenter,
              width: MediaQuery.of(context).size.width / 1.2,
              height: MediaQuery.of(context).size.height * 0.1,
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
                    color: Color(0xFF31BEE8),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            MaterialButton(
              autofocus: true,
              color: Color(0xFF31BEE8),
              height: MediaQuery.of(context).size.height * 0.09,
              minWidth: MediaQuery.of(context).size.width / 1.2,
              shape: StadiumBorder(),
              child: Text(
                'Entrar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * .03),
              ),
              onPressed: loginMethod,
            ),
          ],
        ),
      ),
    );
  }
}
