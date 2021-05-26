library proportional_sizes;

import 'dart:convert';
import 'package:eft_app_comercial/Classes/announcement.dart';
import 'package:eft_app_comercial/Pages/Marketing/marketing.dart';
import 'package:http/http.dart';

//Anuncios
Future getApi() async {
  //Peticion
  Response response = await get(
      Uri.encodeFull("http://192.168.209.136:50000/promo?station=9999"));
  List data = json.decode(response.body)["promos"];
  //Crear clase por cada indice
  for (int c = 0; c < data.length; c++) {
    Marketing.data.add(new Announcement(
        id: data[c]["announcement_id"],
        name: data[c]["a_name"],
        categoryName: data[c]["c_name"],
        image: "https://upload.wikimedia.org/wikipedia/commons/f/f5/Petrol_pump_mp3h0355.jpg",
        text: data[c]["text"]));
  }
}