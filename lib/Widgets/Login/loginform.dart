import 'package:eft_app_comercial/Libraries/decoration_colors.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/proportional_sizes.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
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

  void fetchPost({String user, String password}) async {
    var response = await http.get(
        Uri.parse("http://$ip:50000/client?username=$user&password=$password"));
    if (response.statusCode == 200) {
      // ignore: await_only_futures
      await setLogedUser(int.parse(user), json.decode(response.body)["station"],
          json.decode(response.body)["name"]);
      changePageDrop(
          Home(
              user: int.parse(user),
              station: json.decode(response.body)["station"],
              name: json.decode(response.body)["name"]),
          context);
    } else
      print('invalido');
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
      width: getHorizontalPercent(context, 100),
      height: getVerticalPercent(context, 43),
      child: Form(
        key: _keyvalidate,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: getHorizontalPercent(context, 80),
              height: getVerticalPercent(context, 10),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[200], width: 4),
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
                  fontSize: getVerticalPercent(context, 3.0),
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  hintText: "Usuario",
                  prefixIcon: SizedBox(
                    width: getHorizontalPercent(context, 7),
                    height: getVerticalPercent(context, 7),
                    child: Icon(
                      Icons.email,
                      size: getHorizontalPercent(context, 7),
                      color: blueLight, //#31BEE8
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: getVerticalPercent(context, 3.5)),
            Container(
              alignment: Alignment.topCenter,
              width: getHorizontalPercent(context, 80),
              height: getVerticalPercent(context, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey[200],
                  width: 4,
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
                  fontSize: getVerticalPercent(context, 3.0),
                  color: Colors.blue,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  hintText: "Contraseña",
                  prefixIcon: SizedBox(
                    width: getHorizontalPercent(context, 7),
                    height: getVerticalPercent(context, 7),
                    child: Icon(
                      Icons.vpn_key,
                      size: getHorizontalPercent(context, 6),
                      color: blueLight,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: getVerticalPercent(context, 8),
            ),
            MaterialButton(
              autofocus: true,
              color: blueLight,
              height: getVerticalPercent(context, 9),
              minWidth: getHorizontalPercent(context, 70),
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
