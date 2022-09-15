import 'package:eft_app_comercial/Pages/Login/login.dart';

class LoginResponse{
  String name, namestation, message;
  int station_id, station, code;

  LoginResponse({
    required this.name,
    required this.namestation,
    required this.message,
    required this.station,
    required this.station_id,
    required this.code,
  });
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        station: int.parse(json['station'].toString()),
        station_id: int.parse(json['station_id'].toString()),
        code: int.parse(json['code'].toString()),
        message: json['message'],
        name: json['name'],
        namestation: json['namestation']
    );
  }
}