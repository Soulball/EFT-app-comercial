library media;

import 'package:url_launcher/url_launcher.dart';

//Abrir URL con la aplicacion
Future<void> openURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se ha podido cargar el enlace.';
  }
}