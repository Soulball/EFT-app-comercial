class AdCommission {
  List<Acommissions> commission;

  AdCommission({
    this.commission,
  });

  factory AdCommission.fromJson(Map<String, dynamic> json) {
    return AdCommission(
        commission: (json['commission'] as List)
            .map((data) => Acommissions.fromJson(data))
            .toList());
  }
}

class Acommissions {
  String clasification;
  int points;
  int goal;
  int immediate;
  double accumulated;
  double bonus;
  double total;
  Acommissions({
    this.clasification,
    this.points,
    this.goal,
    this.immediate,
    this.accumulated,
    this.bonus,
    this.total,
  });

  factory Acommissions.fromJson(Map<String, dynamic> parsedJson) {
    return Acommissions(
      clasification: parsedJson['classification'],
      points: int.parse(parsedJson['points'].toString()),
      goal: int.parse(parsedJson['goal'].toString()),
      immediate: int.parse(['immediate'].toString()),
      accumulated: double.parse(parsedJson['accumulated'].toString()),
      bonus: double.parse(parsedJson['bonus'].toString()),
      total: double.parse(parsedJson['total'].toString()),
    );
  }
}
// Future<List<UserTransactions>> getTransactions({String employeeNumber}) async {
//   List<UserTransactions> resp;
//   var response = await http.get(
//       Uri.parse(urlServer + "RH/user/transactions/" + employeeNumber),
//       headers: {
//         HttpHeaders.contentTypeHeader: "application/json",
//       });
//   if (response.statusCode == 200) {
//     try {
//       var jsonResponse = convert.jsonDecode(response.body);
//       resp = (jsonResponse as List).map((p) => UserTransactions.fromJson(p))
//           .toList();
//       print("success");
//     } catch (error) {
//       resp = [];
//       print('Fail deserialize getTransactions');
//       print(error);
//     }
//   } else {
//     resp = [];
//     print('Fail getTransactions');
//     print(response.statusCode);
//   }
//   return resp;
// }