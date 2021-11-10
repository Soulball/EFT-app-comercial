import 'dart:convert';

//Clase para estaciones
class Station {
  //Variables
  int number;
  int id;
  String name;

  //Constructor
  Station({this.number, this.name, this.id});
}
// To parse this JSON data, do
//
//     final station = stationFromJson(jsonString);

SStation stationFromJson(String str) => SStation.fromJson(json.decode(str));

String stationToJson(SStation data) => json.encode(data.toJson());

class SStation {
  SStation({
    this.stations,
    this.code,
    this.message,
  });

  List<StationElement> stations;
  int code;
  String message;

  factory SStation.fromJson(Map<String, dynamic> json) => SStation(
        stations: List<StationElement>.from(
            json["stations"].map((x) => StationElement.fromJson(x))),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "stations": List<dynamic>.from(stations.map((x) => x.toJson())),
        "code": code,
        "message": message,
      };
}

class StationElement {
  StationElement({
    this.number,
    this.station,
    this.commercialname,
  });

  int number;
  int station;
  String commercialname;

  factory StationElement.fromJson(Map<String, dynamic> json) => StationElement(
        number: json["number"],
        station: json["station"],
        commercialname: json["commercialname"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "station": station,
        "commercialname": commercialname,
      };
}
