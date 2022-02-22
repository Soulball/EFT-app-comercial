import 'dart:async';
import 'dart:convert';
import 'dart:convert' as convert;
import 'package:eft_app_comercial/Classes/OtherProducts/adjust.dart';
import 'package:eft_app_comercial/Classes/OtherProducts/descriptioncommission.dart';
import 'package:eft_app_comercial/Classes/OtherProducts/exhibitors.dart';
import 'package:eft_app_comercial/Classes/OtherProducts/productsold.dart';
import 'package:eft_app_comercial/Classes/OtherProducts/rankingxventas.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Adjust/adjustment.dart';
import 'package:eft_app_comercial/Pages/OtherProducts/Reports/report.dart';
import 'package:eft_app_comercial/Widgets/OtherProducts/maxmin.dart';
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

String ip = "http://bd36-201-174-115-7.ngrok.io";

//envia las acciones de maximos y minimos
getSend(int requestId, int productId, int stationId, int maxMovement,
    int minMovement) async {
  await post(
    Uri.parse(ip + '/productsave'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(
      <String, int>{
        "requestId": requestId,
        "productId": productId,
        "stationId": stationId,
        "maxMovement": maxMovement,
        "minMovement": minMovement,
      },
    ),
  );
  print(requestId.toString() +
      " " +
      productId.toString() +
      " " +
      stationId.toString() +
      " " +
      maxMovement.toString() +
      " " +
      minMovement.toString());
}

//obtiene el idrequest para el envio de maximos y minimos
Future getidRequest(int employee, DateTime date, int stationId) async {
  Response response = await get(Uri.encodeFull(
      ip + "/requestId?employee=$employee&date=$date&stationId=$stationId"));
  if (json.decode(response.body)["requestId"] != null) {
    int data = json.decode(response.body)["requestId"];
    if (data != null) {}
  }
}

// obtiene los diferentes componenetes de los exhibidores
Future getCExhibitors(int exhibitor) async {
  //Peticion
  Response response =
      await get(Uri.encodeFull(ip + "/exhibitorsc?exhibitor=$exhibitor"));
  //Comprobar si es nulo
  if (json.decode(response.body)["componentes"] != null) {
    List data = json.decode(response.body)["componentes"];
    for (int c = 0; c < data.length; c++) {
      Report.CExhibitorString.add(data[c]["descriptions"]);
      Report.CExhibitorsList.add(
          new ComponentsExhibitor(data[c]["descriptions"]));
    }
  }
}

//obtiene los diferentes exhibidores
Future getExhibitors() async {
  //Peticion
  Response response = await get(Uri.encodeFull(ip + "/exhibitor"));
  //Comprobar si es nulo
  if (json.decode(response.body)["exhibitors"] != null) {
    List data = json.decode(response.body)["exhibitors"];
    for (int c = 0; c < data.length; c++) {
      Report.ExhibitorString.add(data[c]["name"]);
      Report.ExhibitorsList.add(new Exhibitor(
        exhibitor: data[c]["id_exhibitors"],
        name: data[c]["name"],
      ));
    }
  }
}

//obtiene los diferentes cambios que se hagan en el apartado de otros productos en max y min
Future getChange() async {
  //Peticion
  Response response = await get(Uri.encodeFull(ip + "/change"));
  //Comprobar si es nulo
  if (json.decode(response.body)["change"] != null) {
    List data = json.decode(response.body)["change"];
    for (int c = 0; c < data.length; c++) {
      MaxMin.ChangeState.add(data[c]["change"]);
      MaxMin.ChangeStateClass.add(new StateChange(
        type: data[c]["type"],
        change: data[c]["change"],
      ));
    }
  }
}

//Obtencion de los productos para max y min
Future getAdjust(int station) async {
  Response response = await http.get(ip + "/adjust?station=$station");
  if (json.decode(response.body)["adjust"] != null) {
    List data = json.decode(response.body)["adjust"];
    for (int c = 0; c < data.length; c++) {
      MaxMin.AdjustList.add(data[c]["codes"].toString() +
          data[c]["name"] +
          data[c]["type"].toString() +
          data[c]["max"].toString() +
          data[c]["min"].toString());
      MaxMin.AdjustListClass.add(
        new Adjust(
            codes: data[c]["codes"],
            name: data[c]["name"],
            type: data[c]["type"],
            max: data[c]["max"],
            min: data[c]["min"]),
      );
      print(Adjustment.StationList.length);
    }
  }
}

//obtencion de estaciones para el apartado de Ajustes
Future getStation() async {
  //Peticion
  Response response = await get(Uri.encodeFull(ip + "/stationnumber"));
  //Comprobar si es nulo
  if (json.decode(response.body)["stations"] != null) {
    List data = json.decode(response.body)["stations"];
    for (int c = 0; c < data.length; c++) {
      Adjustment.StationList.add(data[c]["station"].toString() +
          ".-" +
          " " +
          data[c]["number"].toString() +
          " - " +
          data[c]["commercialname"]);
      Adjustment.StationListClass.add(new Station(
          number: data[c]["number"],
          name: data[c]["commercialname"],
          id: data[c]["station"]));
    }
  }
}

// obtencion del total de las comisiones
Future<Total> getTotal(int user) async {
  final response = await http.get(ip + "/commissionT?employee=$user");
  if (response.statusCode == 200) {
    final Total totalC = totalFromJson(response.body);
    return totalC;
  } else {
    throw Total(code: -1, message: "Error al llamar el servicio");
  }
}

// obtencion de datos para el apartado de ranking para las descripciones de ---
// comisiones
Future<Description> getDescription() async {
  final response = await http.get(ip + "/description");
  if (response.statusCode == 200) {
    final Description description = descriptionFromJson(response.body);
    return description;
  } else {
    throw Description(code: -1, message: "Falla del Servicio");
  }
}

//obtencion de imagenes para los apartados de imagenes x zonas, foraneas y de -
//concursos
Future<ImageRanking> getranking(int user, String type) async {
  ImageRanking resp = new ImageRanking();
  final response = await http.get(ip + "/consultimage?user=$user&type=$type");
  if (response.statusCode == 200) {
    var jsonResponse = convert.jsonDecode(response.body);
    resp = ImageRanking.fromJson(jsonResponse);
    return resp;
  } else {
    resp = ImageRanking(code: -1, message: "Error al llamar el servicio");
  }
  return resp;
}

// obtencion de Productos vendidos por el empleado ----------------------------
Future<ProductSold> getTransaction(int employee) async {
  final response = await http.get(ip + "/transaction?user=$employee");
  if (response.statusCode == 200) {
    final ProductSold product = ProductSoldFromJson(response.body);
    return product;
  } else {
    throw Exception('Failed to load Data');
  }
}

//obtencion de Comisiones del empleado
Future<Acommission> getcommissions(int employee) async {
  final response = await http.get(ip + "/commission?employee=$employee");
  if (response.statusCode == 200) {
    final Acommission commissions = AcommissionFromJson(response.body);
    print(commissions.commission.length);
    print(commissions);
    return commissions;
  } else {
    throw Exception('Failed to load Data');
  }
}

//Buscar todas las estaciónes en buscador de estaciónes -----------------------
Future getStations() async {
  //Peticion
  Response response = await get(Uri.encodeFull(ip + "/stationnumber"));
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
  Response response = await get(Uri.encodeFull(ip + "/stationnumber"));
  //Comprobar si es nulo
  if (json.decode(response.body)["stations"] != null) {
    List data = json.decode(response.body)["stations"];
    for (int c = 0; c < data.length; c++) {
      Marketing.allStationList.add(
          data[c]["commercialname"] + " - " + data[c]["number"].toString());
      Marketing.allStationListClass.add(new Station(
          number: data[c]["number"], name: data[c]["commercialname"]));
    }
    print(data);
    print(data.length.toString());
  }
}

//Conseguir noticias ----------------------------------------------------------
Future getNews(int station) async {
  Response response =
      await get(Uri.encodeFull(ip + "/announcement?station=$station"));

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
  Response response = await get(Uri.encodeFull(ip + "/promo?station=$station"));

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
    response = await get(Uri.encodeFull(ip + "/reaction?user=$user"));

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
  Response response =
      await get(Uri.encodeFull(ip + "/detail?announcement=$announcement"));
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
  await put(Uri.parse(ip + '/upfreaction'),
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
  await put(Uri.parse(ip + '/uplreaction'),
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
  await post(Uri.parse(ip + '/sendreaction'),
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

//Subir activación ------------------------------------------------------------
uploadActivation(
    int employee, int station, String activationType, String note) async {
  await post(Uri.parse(ip + '/sendcardactivation'),
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
  await post(Uri.parse(ip + '/sendblocksolicitude'),
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
  await post(Uri.parse(ip + '/sendcardsolicitude'),
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

//Subir Solicitud de Materiales -----------------------------------------------
uploadMaterialSolicitude(
    int employee, int station, int turn, String note) async {
  Response response = await post(Uri.parse(ip + '/sendmaterial'),
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

//Subir a la tabla de relación Solicitudes y materiales -----------------------
uploadMaterialSolicitudeRelation(
    int materialSolicitude, int material, int amount) async {
  await post(Uri.parse(ip + '/sendfmaterial'),
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
