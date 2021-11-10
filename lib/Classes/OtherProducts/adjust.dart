import 'dart:convert';

//clase que envia los diferentes estados para maximizar o minimizar un producto
class StateChange {
  int type;
  String change;
  StateChange({
    this.type,
    this.change,
  });
}

// To parse this JSON data, do
//
//     final adjust = adjustFromJson(jsonString);
Adjust adjustFromJson(String str) => Adjust.fromJson(json.decode(str));

String adjustToJson(Adjust data) => json.encode(data.toJson());

class Adjust {
  Adjust({
    this.adjust,
    this.code,
    this.message,
  });

  List<AdjustElement> adjust;
  int code;
  String message;

  factory Adjust.fromJson(Map<String, dynamic> json) => Adjust(
        adjust: List<AdjustElement>.from(
            json["adjust"].map((x) => AdjustElement.fromJson(x))),
        code: json["code"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "adjust": List<dynamic>.from(adjust.map((x) => x.toJson())),
        "code": code,
        "message": message,
      };
}

class AdjustElement {
  AdjustElement({
    this.codes,
    this.name,
    this.type,
    this.max,
    this.min,
  });

  int codes;
  String name;
  int type;
  int max;
  int min;

  factory AdjustElement.fromJson(Map<String, dynamic> json) => AdjustElement(
        codes: json["codes"],
        name: json["name"],
        type: json["type"],
        max: json["max"],
        min: json["min"],
      );

  Map<String, dynamic> toJson() => {
        "codes": codes,
        "name": name,
        "type": type,
        "max": max,
        "min": min,
      };
}
