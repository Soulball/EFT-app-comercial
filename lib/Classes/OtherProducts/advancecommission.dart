// @dart=2.9

import 'dart:convert';

// ignore: non_constant_identifier_names
Acommission AcommissionFromJson(String str) =>
    Acommission.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
String AcommissionToJson(Acommission data) => json.encode(data.toJson());

class Acommission {
  Acommission({
    this.commission,
  });

  List<Commission> commission;

  factory Acommission.fromJson(Map<String, dynamic> json) => Acommission(
      commission: List<Commission>.from(
          json["commission"].map((x) => Commission.fromJson(x))));

  Map<String, dynamic> toJson() => {
        "commission": List<dynamic>.from(commission.map((x) => x.toJson())),
      };
}

class Commission {
  Commission({
    this.classification,
    this.points,
    this.goal,
    this.accumulated,
    this.bonus,
    this.total,
  });

  String classification;
  int points;
  int goal;
  int accumulated;
  int bonus;
  int total;

  factory Commission.fromJson(Map<String, dynamic> json) => Commission(
        classification: json["classification"],
        points: json["points"],
        goal: json["goal"],
        accumulated: json["accumulated"],
        bonus: json["bonus"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "classification": classification,
        "points": points,
        "goal": goal,
        "accumulated": accumulated,
        "bonus": bonus,
        "total": total,
      };
}

Total totalFromJson(String str) => Total.fromJson(json.decode(str));

class Total {
  int totalc;
  int code;
  String message;
  Total({
    this.totalc,
    this.code,
    this.message,
  });
  factory Total.fromJson(Map<String, dynamic> json) => Total(
      code: json["code"], totalc: json["totalc"], message: json["message"]);
}
