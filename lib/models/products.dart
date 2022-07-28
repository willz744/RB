// To parse this JSON data, do
//
//     final products = productsFromMap(jsonString);

import 'dart:convert';

Products productsFromMap(String str) => Products.fromMap(json.decode(str));

String productsToMap(Products data) => json.encode(data.toMap());

class Products {
    Products({
        this.success,
        this.data,
        this.code,
    });

    bool ?success;
    List<Datum> ?data;
    int ?code;

    factory Products.fromMap(Map<String, dynamic> json) => Products(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        code: json["code"],
    );

    Map<String, dynamic> toMap() => {
        "success": success,
     //   "data": List<dynamic>.from(data?.map((x) => x.toMap())),
        "code": code,
    };
}

class Datum {
    Datum({
        this.itemId,
        this.itemName,
        this.price,
        this.picture,
        this.description,
        this.status,
    });

    String ?itemId;
    String ?itemName;
    String ?price;
    String ?picture;
    String ?description;
    int ?status;

    factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        itemId: json["item_id"],
        itemName: json["item_name"],
        price: json["price"],
        picture: json["picture"],
        description: json["description"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "item_id": itemId,
        "item_name": itemName,
        "price": price,
        "picture": picture,
        "description": description,
        "status": status,
    };
}
