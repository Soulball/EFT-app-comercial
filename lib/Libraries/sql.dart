import 'dart:async';
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:eft_app_comercial/Classes/OtherProducts/advancecommission.dart';
import 'package:eft_app_comercial/Classes/announcement.dart';
import 'package:eft_app_comercial/Classes/detail.dart';
import 'package:eft_app_comercial/Classes/fav_and_like.dart';
import 'package:eft_app_comercial/Classes/station.dart';
import 'package:eft_app_comercial/Pages/Marketing/marketing.dart';
import 'package:eft_app_comercial/Pages/Marketing/promotions.dart';
import 'package:eft_app_comercial/Pages/Marketing/promotionDetails.dart';
import 'package:eft_app_comercial/Pages/News/news.dart';
import 'package:eft_app_comercial/Pages/stationSearch.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

//String ip = "172.30.16.1"
<<<<<<< HEAD
String ip = "192.168.209.123";
//String ip = "192.168.209.151";

//Buscar todas las estaciónes en buscador de estaciónes -----------------------
=======
//String ip = "192.168.209.151";

//obtencion de Comisiones del empleado
Future<AdCommission> getCommission(int employee) async {
  AdCommission resp;
  final response = await http
      .get(Uri.encodeFull("http://$ip:50000/commission?employee=$employee"));

  if (response.statusCode == 200) {
    try {
      final jResponse = convert.jsonDecode(response.body);
      resp = (jResponse).map((p) => AdCommission.fromJson(p)).toList();
      return null;
    } catch (error) {
      print('Falla deserealizable');
      print(error);
      return null;
    }
  } else {
    print('Falla en getCommission');
    print(response.statusCode);
  }
  return resp;
}

//Buscar todas las estaciónes ---------------------------------------------------------------------
String ip = "192.168.209.151";

//Buscar todas las estaciónes en buscador de estaciónes ---------------------------------------------------------------------
>>>>>>> 52817c15e116886a49b882636f6820c95cd7edac
Future getStations() async {
  //Peticion
  Response response =
      await get(Uri.encodeFull("http://$ip:50000/stationnumber"));

  //Comprobar si es nulo
  if (json.decode(response.body)["stations"] != null) {
    List data = json.decode(response.body)["stations"];
    for (int c = 0; c < data.length; c++) {
      StationSearcher.stationZonelist.add(new Station(
          number: data[c]["number"], name: data[c]["commercialname"]));
    }
  }
}

//Buscar todas las estaciónes en marketing ------------------------------------
Future getAllStations() async {
  //Peticion
  Response response =
      await get(Uri.encodeFull("http://$ip:50000/stationnumber"));

  //Comprobar si es nulo
  if (json.decode(response.body)["stations"] != null) {
    List data = json.decode(response.body)["stations"];
    for (int c = 0; c < data.length; c++) {
      Marketing.allStationList.add(
          data[c]["commercialname"] + " - " + data[c]["number"].toString());
      Marketing.allStationListClass.add(new Station(
          number: data[c]["number"], name: data[c]["commercialname"]));
    }
    print(data.length.toString());
  }
}

//Conseguir noticias ----------------------------------------------------------
Future getNews(int station) async {
  Response response = await get(
      Uri.encodeFull("http://$ip:50000/announcement?station=$station"));

  //Comprobar si es nulo
  News.newList.clear();
  if (json.decode(response.body)["announcements"] != null) {
    List data = json.decode(response.body)["announcements"];
    for (int c = 0; c < data.length; c++) {
      News.newList.add(new Announcement(
          id: data[c]["announcement_id"],
          name: data[c]["a_name"],
          categoryName: data[c]["c_name"],
          image:
              "https://upload.wikimedia.org/wikipedia/commons/f/f5/Petrol_pump_mp3h0355.jpg",
          text: data[c]["text"]));
    }
  }
  print(News.newList.length);
}

//Promociones -----------------------------------------------------------------
Future getApi(int station, int user) async {
  //Peticion
  Response response =
      await get(Uri.encodeFull("http://$ip:50000/promo?station=$station"));

  //Comprobar si es nulo
  if (json.decode(response.body)["promos"] != null) {
    List data = json.decode(response.body)["promos"];
    for (int c = 0; c < data.length; c++) {
      Promotion.promoList.add(new Announcement(
          id: data[c]["announcement_id"],
          name: data[c]["a_name"],
          categoryName: data[c]["c_name"],
          image:
              "https://upload.wikimedia.org/wikipedia/commons/f/f5/Petrol_pump_mp3h0355.jpg",
          text: data[c]["text"]));
    }
    //Favoritos y gustados por el usuario
    response =
        await get(Uri.encodeFull("http://$ip:50000/reaction?user=$user"));

    //Cromprobar si es nulo
    if (json.decode(response.body)["reactions"] != null) {
      data = json.decode(response.body)["reactions"];
      for (int c = 0; c < data.length; c++) {
        Promotion.favAndLikeList.add(new Reactions(
            id: data[c]["announcement_id"],
            favorite: data[c]["favorite"],
            like: data[c]["liked"]));
      }
    }
  }
}

//Detalles --------------------------------------------------------------------
Future getDetails(int announcement) async {
  //Peticion
  Response response = await get(
      Uri.encodeFull("http://$ip:50000/detail?announcement=$announcement"));
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

//Buscar en la lista ----------------------------------------------------------
bool insertInList(int announcementId) {
  for (int c = 0; c < Promotion.favAndLikeList.length; c++) {
    if (Promotion.favAndLikeList[c].id == announcementId) {
      return true;
    }
  }
  return false;
}

//Actualizar favorito ---------------------------------------------------------
updateFavorite(int announcement, int user, bool favorite) async {
  await put(Uri.parse('http://$ip:50000/upfreaction'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'announcement': announcement,
        'user': user,
        'favorite': favorite
      }));
  print('piola');
}

//Actualizar me gusta ---------------------------------------------------------
updateLike(int announcement, int user, bool liked) async {
  await put(Uri.parse('http://$ip:50000/uplreaction'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'announcement': announcement,
        'user': user,
        'liked': liked
      }));
  print('piola2');
}

//Insertar reacciónes ---------------------------------------------------------
insertReactions(int announcement, int user, bool liked, bool favorite) async {
  await post(Uri.parse('http://$ip:50000/sendreaction'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'announcement': announcement,
        'user': user,
        'liked': liked,
        'favorite': favorite
      }));
  print('piola3');
}
