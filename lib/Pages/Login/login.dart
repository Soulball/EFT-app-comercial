import 'package:eft_app_comercial/Widgets/Login/header.dart';
import 'package:eft_app_comercial/Widgets/Login/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../Utils.dart';

class Login extends StatelessWidget {
  static int user = 0;
  static int station = 0;
  static String name = "";
  static String nameStation = "";

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
            statusBarColor: Color(0xFF0C14A4),
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light),
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
                LayoutBuilder(builder: (context, constraints) {
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
                            )),
                            SizedBox(
                              height: getScreenHeight(context) * .2,
                            ),
                            Text(
                              "Usuario",
                              style: TextStyle(
                                  color: AppColors.PrettyBlue,
                                  fontSize: 18,
                                  fontFamily: 'MADE TOMMY'),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextField(
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
                              "Contraseña",
                              style: TextStyle(
                                  color: AppColors.PrettyBlue, fontSize: 18),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: TextField(
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
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    suffixIconColor:
                                        true ? Colors.black : Colors.grey[600],
                                    suffixIcon: IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                            true
                                                ? Icons.visibility
                                                : Icons.visibility_off,
                                            color: true
                                                ? Colors.blue
                                                : Colors.grey[600]))),
                              ),
                            ),
                            SizedBox(
                              height: getScreenHeight(context) * .05,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                GestureDetector(
                                  onTap: null,
                                  child: const Text(
                                    '¿Olvido su contraseña?',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                )
                              ],
                            ),
                            SizedBox(
                              height: getScreenHeight(context) * .05,
                            ),
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
                                      Colors.blue,
                                      Color.fromARGB(255, 137, 192, 237)
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
                                            borderRadius:
                                                BorderRadius.circular(50.0))),
                                  ),
                                  onPressed: () {},
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
                            const Spacer(
                              flex: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ));
  }
}
