import 'dart:convert';

Description descriptionFromJson(String str) =>
    Description.fromJson(json.decode(str));

class Description {
  Description({
    this.descriptions,
    this.code,
    this.message,
  });

  List<DescriptionElement> descriptions;
  int code;
  String message;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
        descriptions: List<DescriptionElement>.from(
            json["descriptions"].map((x) => DescriptionElement.fromJson(x))),
        code: json["code"],
        message: json["message"],
      );
}

class DescriptionElement {
  DescriptionElement({
    this.classificationId,
    this.parentClassification,
    this.classificationName,
    this.quantity,
    this.employeeAmount,
    this.currency,
    this.hasDetail,
    this.descriptions,
  });

  int classificationId;
  String parentClassification;
  String classificationName;
  int quantity;
  double employeeAmount;
  String currency;
  int hasDetail;
  List<DescriptionElement> descriptions;

  factory DescriptionElement.fromJson(Map<String, dynamic> json) =>
      DescriptionElement(
        classificationId: json["classification_id"],
        parentClassification: json["parent_classification"],
        classificationName: json["classification_name"],
        quantity: json["quantity"],
        employeeAmount: json["employee_amount"].toDouble(),
        currency: json["currency"],
        hasDetail: json["hasDetail"],
        descriptions: json["descriptions"] == null
            ? []
            : List<DescriptionElement>.from(json["descriptions"]
                .map((x) => DescriptionElement.fromJson(x))),
      );
}
