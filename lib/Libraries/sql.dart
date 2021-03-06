import 'dart:async';
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:eft_app_comercial/Classes/OtherProducts/descriptioncommission.dart';
import 'package:eft_app_comercial/Classes/OtherProducts/productsold.dart';
import 'package:eft_app_comercial/Classes/OtherProducts/rankingxventas.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:eft_app_comercial/Classes/OtherProducts/advancecommission.dart';
import 'package:eft_app_comercial/Classes/announcement.dart';
import 'package:eft_app_comercial/Classes/detail.dart';
import 'package:eft_app_comercial/Classes/fav_and_like.dart';
import 'package:eft_app_comercial/Classes/station.dart';
import 'package:eft_app_comercial/Libraries/media.dart';
import 'package:eft_app_comercial/Pages/Marketing/marketing.dart';
import 'package:eft_app_comercial/Pages/Marketing/promotions.dart';
import 'package:eft_app_comercial/Pages/Marketing/promotionDetails.dart';
import 'package:eft_app_comercial/Pages/News/news.dart';
import 'package:eft_app_comercial/Pages/stationSearch.dart';

//String ip = "172.25.144.1";

// obtencion del total de las comisiones
Future<Total> getTotal(int user) async {
  final response =
      await http.get("http://$ip:50000/commissionT?employee=$user");
  if (response.statusCode == 200) {
    final Total totalC = totalFromJson(response.body);
    print(response.body);
    print(totalC);
    return totalC;
  } else {
    throw Total(code: -1, message: "Error al llamar el servicio");
  }
}

// obtencion de datos para el apartado de ranking para las descripciones de comisiones
Future<Description> getDescription() async {
  final response = await http.get("http://$ip:50000/description");
  if (response.statusCode == 200) {
    final Description description = descriptionFromJson(response.body);
    print(description.descriptions.length);
    print(response.body);
    return description;
  } else {
    throw Exception('Failed to load Data');
  }
}

//obtencion de imagenes para los apartados de imagenes x zonas, foraneas y de concursos
Future<ImageRanking> getranking(int user, String type) async {
  ImageRanking resp = new ImageRanking();
  final response =
      await http.get("http://$ip:50000/consultimage?user=$user&type=$type");
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    resp = ImageRanking.fromJson(jsonResponse);
    print(jsonResponse);
    print(resp);
    return resp;
  } else {
    resp = ImageRanking(code: -1, message: "Error al llamar el servicio");
  }
  return resp;
}

// obtencion de Productos vendidos por el empleado
Future<ProductSold> getTransaction(int employee) async {
  final response =
      await http.get("http://$ip:50000/transaction?user=$employee");
  if (response.statusCode == 200) {
    final ProductSold product = ProductSoldFromJson(response.body);
    print(response.body);
    print(product.products.length);
    return product;
  } else {
    throw Exception('Failed to load Data');
  }
}

//obtencion de Comisiones del empleado
Future<Acommission> getcommissions(int employee) async {
  final response =
      await http.get("http://$ip:50000/commission?employee=$employee");
  if (response.statusCode == 200) {
    final Acommission commissions = AcommissionFromJson(response.body);
    print(response.body);
    print(commissions.commission.length);
    return commissions;
  } else {
    throw Exception('Failed to load Data');
  }
}

//Buscar todas las estaci??nes ---------------------------------------------------------------------
//String ip = "172.27.16.1";

//Buscar todas las estaci??nes en buscador de estaci??nes ---------------------------------------------------------------------

//String ip = "172.30.16.1"
String ip = "192.168.209.123";
//String ip = "192.168.209.151";

//Buscar todas las estaci??nes en buscador de estaci??nes -----------------------
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

//Buscar todas las estaci??nes en marketing ------------------------------------
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

//Insertar reacci??nes ---------------------------------------------------------
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

//Subir activaci??n ------------------------------------------------------------
uploadActivation(
    int employee, int station, String activationType, String note) async {
  await post(Uri.parse('http://$ip:50000/sendcardactivation'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "employee": employee,
        "station": station,
        "activation_type": activationType,
        "note": note
      }));
  print('piola4');
}

//Subir bloque de tarjeta -----------------------------------------------------
uploadCardBlock(int employee, int station, int amount, int turn) async {
  await post(Uri.parse('http://$ip:50000/sendblocksolicitude'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "employee": employee,
        "station": station,
        "amount": amount,
        "turn": turn
      }));
  print('piola');
}

//Subir Solicitud de Tarjeta --------------------------------------------------
uploadCardSolicitude(int employee, int station, String type, String name,
    String phone, String email, String note) async {
  await post(Uri.parse('http://$ip:50000/sendcardsolicitude'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "employee": employee,
        "station": station,
        "card_type": type,
        "customer_name": name,
        "customer_phone": phone,
        "customer_email": email,
        "note": note
      }));
  print('piola');
}

//Subir Solicitud de Materiales --------------------------------------------------
uploadMaterialSolicitude(
    int employee, int station, int turn, String note) async {
  Response response = await post(Uri.parse('http://$ip:50000/sendmaterial'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "employee": employee,
        "station": station,
        "turn": turn,
        "note": note
      }));
  for (int c = 0; c < materialList.length; c++) {
    if (materialList[c].counter > 0)
      uploadMaterialSolicitudeRelation(json.decode(response.body)["material"],
          c + 1, materialList[c].counter);
  }
  print('piola');
}

//Subir a la tabla de relaci??n Solicitudes y materiales
uploadMaterialSolicitudeRelation(
    int materialSolicitude, int material, int amount) async {
  await post(Uri.parse('http://$ip:50000/sendfmaterial'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        "material_solicitude": materialSolicitude,
        "material": material,
        "amount": amount
      }));
  print(amount.toString() + " de " + material.toString());
}
