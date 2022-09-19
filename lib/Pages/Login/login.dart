import 'package:eft_app_comercial/Widgets/Login/header.dart';
import 'package:eft_app_comercial/Widgets/Login/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Animation.dart';
import '../../Classes/LoginResponse.dart';
import '../../Libraries/sql.dart';
import '../../Utils.dart';
import '../home.dart';

class Login extends StatefulWidget {
  _Login createState() => _Login();
  static int user = 0;
  static int station = 0;
  static String name = "";
  static String nameStation = "";
}
class _Login extends State<Login> {

  final usuario = TextEditingController();
  final password = TextEditingController();
  late LoginResponse response;


  late bool _isObscure;
  late FocusNode myFocusNode;

  @override
  void dispose() {
    usuario.dispose();
    password.dispose();
  }

  @override
  void initState() {
    myFocusNode = FocusNode();
    _isObscure = true;
  }

  void loginMethod() async {
    onLoading(context);
    response = await makeLogin(usuario.text, password.text);
    if (response.code == 0) {
      if (response.name.isNotEmpty) {
        print(response.name);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('user', usuario.text);
        prefs.setString('password', password.text);
        closeLoading(context);
        Navigator.push(context,
          MaterialPageRoute(builder: (context) =>
              Home(user: int.parse(usuario.text.toString()),
                  name: response.name,
                  nameStation: response.namestation,
                  station: response.station),),);
      } else {
        print("no jala");
      }
    }
    else {
      closeLoading(context);
      displayMessage(context: context,
          title: "Atención",
          message: "Nombre de usuario y/o contraseña incorrecta");
      print("Contraseña incorrecta");
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF0C14A4),
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light
        ),
        child: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            body: Stack(
              children: [
                Opacity(
                  opacity: 0.9,
                  child: Container(
                    color: AppColors.Fondo,
                  ),
                ),
                LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              minWidth: constraints.maxWidth,
                              minHeight: constraints.maxHeight),
                          child: IntrinsicHeight(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                    child: Stack(
                                      alignment: Alignment.center,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Header(),
                                        Logo(),
                                      ],
                                    )
                                ),
                                SizedBox(
                                  height: getScreenHeight(context) * .2,),
                                Text(
                                  "Usuario", style: TextStyle(
                                    color: AppColors.PrettyBlue,
                                    fontSize: 18,
                                    fontFamily: 'MADE TOMMY'),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: TextField(
                                    controller: usuario,
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
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  "Contraseña", style: TextStyle(
                                    color: AppColors.PrettyBlue, fontSize: 18),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: TextField(
                                    controller: password,
                                    focusNode: myFocusNode,
                                    textAlign: TextAlign.start,
                                    decoration: InputDecoration(
                                        hintStyle: const TextStyle(
                                          fontSize: 16,
                                          color: Colors.grey,
                                        ),
                                        hintText: 'Contraseña',
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                              15),
                                        ),
                                        suffixIconColor:
                                        _isObscure ? Colors.black : Colors
                                            .grey[600],
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
                                  height: getScreenHeight(context) * .05,),
                                Row(
                                  children: [
                                    const Spacer(),
                                    GestureDetector(
                                      onTap: null,
                                      child: const Text(
                                        'Olvido su contraseña?',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                    ),
                                    const SizedBox(width: 15,)
                                  ],
                                ),
                                SizedBox(
                                  height: getScreenHeight(context) * .05,),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: Container(
                                    height: 60,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: <Color>[
                                          AppColors.PurpleBlue,
                                          AppColors.PrettyBlue
                                        ],
                                      ),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                    child: TextButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius: BorderRadius
                                                    .circular(50.0))),
                                      ),
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
                                ),
                                const Spacer(flex: 5,),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                ),
              ],
            ),
          ),
        )
    );
  }
}


