import 'dart:async';
import 'dart:convert';
import 'package:eft_app_comercial/Classes/announcement.dart';
import 'package:eft_app_comercial/Classes/detail.dart';
import 'package:eft_app_comercial/Classes/fav_and_like.dart';
import 'package:eft_app_comercial/Pages/Marketing/marketing.dart';
import 'package:eft_app_comercial/Pages/Marketing/promotionDetails.dart';
import 'package:http/http.dart';

//Promociones
Future getApi(int station, int user) async {
  //Peticion
  Response response = await get(
      Uri.encodeFull("http://192.168.209.136:50000/promo?station=$station"));

  //Comprobar si es nulo
  if (json.decode(response.body)["promos"] != null) {
    List data = json.decode(response.body)["promos"];
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
        Uri.encodeFull("http://192.168.209.136:50000/reaction?user=$user"));

    //Cromprobar si es nulo
    if (json.decode(response.body)["reactions"] != null) {
      data = json.decode(response.body)["reactions"];
      for (int c = 0; c < data.length; c++) {
        Marketing.favAndLikeList.add(new Reactions(
            id: data[c]["announcement_id"],
            favorite: data[c]["favorite"],
            like: data[c]["liked"]));
      }
    }
  }
}

//Insertar reacciones
Future insertReactions(
    int user, int announcement, bool favorite, bool like) async {
  //Peticion
  await get(Uri.encodeFull(
      "http://192.168.209.136:50000/reaction?user=$user&announcement=$announcement&favorite=$favorite&like=$like"));
}

//Actualizar favorito
Future updateFavorite(int user, int announcement, bool favorite) async {
  //Peticion
  await get(Uri.encodeFull(
      "http://192.168.209.136:50000/reaction?user=$user&announcement=$announcement&favorite=$favorite"));
}

//Actualizar favorito
Future updateLike(int user, int announcement, bool like) async {
  //Peticion
  await get(Uri.encodeFull(
      "http://192.168.209.136:50000/reaction?user=$user&announcement=$announcement&favorite=$like"));
}

//Detalles
Future getDetails(int announcement) async {
  //Peticion
  Response response = await get(Uri.encodeFull(
      "http://192.168.209.136:50000/detail?announcement=$announcement"));
  PromotionDetails.detailList.clear();

  //Comprobar si es nulo
  if (json.decode(response.body)["details"] != null) {
    List data = json.decode(response.body)["details"];
    for (int c = 0; c < data.length; c++) {
      PromotionDetails.detailList.add(
          new Detail(title: data[c]["title"], subtitle: data[c]["subtitle"]));
    }
  }
}

//Tutoriales
Future getTutorials(int station, String type) async {
  //Peticion
  Response response = await get(Uri.encodeFull(
      "http://192.168.209.136:50000/tutorial?station=$station&type=$type"));
  //PromotionDetails.detailList.clear();

  //Comprobar si es nulo
  if (json.decode(response.body)["tutorials"] != null) {
    List data = json.decode(response.body)["tutorials"];
    for (int c = 0; c < data.length; c++) {
      //PromotionDetails.detailList.add(
      //new Detail(title: data[c]["title"], subtitle: data[c]["subtitle"]));
    }
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
