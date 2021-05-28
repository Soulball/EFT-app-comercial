import 'dart:convert';
import 'package:eft_app_comercial/Classes/announcement.dart';
import 'package:eft_app_comercial/Classes/fav_and_like.dart';
import 'package:eft_app_comercial/Pages/Marketing/marketing.dart';
import 'package:http/http.dart';

//Promociones
Future getApi(String station, String user) async {
  //Peticion
  Response response = await get(
      Uri.encodeFull("http://192.168.100.9:50000/promo?station=$station"));
  List data = json.decode(response.body)["promos"];
  //Crear clase por cada indice de promos
  for (int c = 0; c < data.length; c++) {
    Marketing.promoList.add(new Announcement(
        id: data[c]["announcement_id"],
        name: data[c]["a_name"],
        categoryName: data[c]["c_name"],
        image:
            "https://upload.wikimedia.org/wikipedia/commons/f/f5/Petrol_pump_mp3h0355.jpg",
        text: data[c]["text"]));
  }
  //Favoritos y gustados por el usuario
  response = await get(
      Uri.encodeFull("http://192.168.100.9:50000/reaction?user=$user"));
  data = json.decode(response.body)["reactions"];
  for (int c = 0; c < data.length; c++) {
    Marketing.favAndLikeList.add(new Reactions(
        id: data[c]["announcement_id"],
        favorite: data[c]["favorite"],
        like: data[c]["liked"]));
  }
}

//Buscar en la lista
bool insertInList(int announcementId) {
  for (int c = 0; c < Marketing.favAndLikeList.length; c++) {
    if (Marketing.favAndLikeList[c].id == announcementId) {
      return true;
    }
  }
  return false;
}
