import 'dart:convert';

PackagesModelList packagesModelListFromJson(String str) =>
    PackagesModelList.fromJson(json.decode(str));

String packagesModelListToJson(PackagesModelList data) =>
    json.encode(data.toJson());

class PackagesModelList {
  String? code;
  String? status;
  String? message;
  List<Response>? response;

  PackagesModelList({
    this.code,
    this.status,
    this.message,
    this.response,
  });

  factory PackagesModelList.fromJson(Map<String, dynamic> json) =>
      PackagesModelList(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        response: json["response"] == null
            ? []
            : List<Response>.from(
                json["response"]!.map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "response": response == null
            ? []
            : List<dynamic>.from(response!.map((x) => x.toJson())),
      };
}

class Response {
  String? title;
  String? price;
  String? desc;

  Response({
    this.title,
    this.price,
    this.desc,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        title: json["title"],
        price: json["price"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "price": price,
        "desc": desc,
      };
}
