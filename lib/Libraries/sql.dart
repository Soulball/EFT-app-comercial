library proportional_sizes;

import 'dart:convert';
import 'package:eft_app_comercial/Pages/Marketing/marketing.dart';
import 'package:http/http.dart';

Future getApi() async {
  Response response =
      await get(Uri.encodeFull(""), headers: {"Accept": "Application/json"});
  Marketing.list = json.decode(response.body);
}

//print(Marketing.list[index]["name"]);
