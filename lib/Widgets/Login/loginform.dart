import 'package:eft_app_comercial/Animation.dart';
import 'package:eft_app_comercial/Bloc/Home/home_bloc.dart';
import 'package:eft_app_comercial/Classes/LoginResponse.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Libraries/sql.dart';
import 'package:eft_app_comercial/Pages/home.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/prueba.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils.dart';

class LoginForm extends StatefulWidget {
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final user = TextEditingController();
  final password = TextEditingController();
  late LoginResponse response;


  late bool _isObscure;
  late FocusNode myFocusNode;

  @override
  void dispose() {
    user.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void initState()
  {
    myFocusNode = FocusNode();
    _isObscure = true;
  }

  String ip = "http://10.255.247.111:5698";

  void loginMethod() async {
    onLoading(context);
    response = await makeLogin(user.text, password.text);
    if (response.code == 0) {
      if (response.name.isNotEmpty) {
        print(response.name);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('user', user.text);
        prefs.setString('password', password.text);
        closeLoading(context);
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => Home(user: int.parse(user.text.toString()),
              name: response.name,
              nameStation: response.namestation,
              station: response.station),),);

      }else {
        print("no jala");
      }
    }
    else {
      closeLoading(context);
      displayMessage(context: context, title: "Atención", message: "Nombre de usuario y/o contraseña incorrecta");
      print("Contraseña incorrecta");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: getScreenWith(context)*90,
      height: getScreenHeight(context)*.90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Usuario",style: TextStyle(color: Colors.cyan, fontSize: 18,fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: user,
              autofocus: true,
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.verified_user_rounded,
                ),
                hintStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                hintText: 'Usuario',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onSubmitted: (values){
                myFocusNode.requestFocus();
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            "Contraseña",style: TextStyle(color: Colors.cyan, fontSize: 18, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: TextField(
              controller: password,
              focusNode: myFocusNode,
              textAlign: TextAlign.start,
              obscureText: _isObscure,
              decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  hintText: 'Contraseña',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  suffixIconColor:
                  _isObscure ? Colors.black : Colors.grey[600],
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      icon: Icon(
                          _isObscure
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: _isObscure
                              ? Colors.blue
                              : Colors.grey[600]))),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            height: 60,
            width: getScreenWith(context)*.70,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[
                  Colors.cyan,
                  Colors.cyanAccent,
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: TextButton(
              onPressed: loginMethod,
              child: const Text(
                "Iniciar sesion",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}