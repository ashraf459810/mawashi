// To parse this JSON data, do
//
//     final cartResponseModel = cartResponseModelFromJson(jsonString);

import 'dart:convert';

CartResponseModel cartResponseModelFromJson(String str) => CartResponseModel.fromJson(json.decode(str));

String cartResponseModelToJson(CartResponseModel data) => json.encode(data.toJson());

class CartResponseModel {
    CartResponseModel({
        this.success,
        this.error,
        this.data,
    });

    int ?success;
    List<dynamic>? error;
    List<Datum> ?data;

    factory CartResponseModel.fromJson(Map<String, dynamic> json) => CartResponseModel(
        success: json["success"],
        error: List<dynamic>.from(json["error"].map((x) => x)),
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "error": List<dynamic>.from(error!.map((x) => x)),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.cartId,
        this.productId,
        this.name,
        this.model,
        this.shipping,
        this.image,
        this.option,
        this.download,
        this.quantity,
        this.minimum,
        this.subtract,
        this.stock,
        this.price,
        this.total,
        this.reward,
        this.points,
        this.taxClassId,
        this.weight,
        this.weightClassId,
        this.length,
        this.width,
        this.height,
        this.lengthClassId,
        this.recurring,
    });

    String ?cartId;
    String? productId;
    String ?name;
    String ?model;
    String ?shipping;
    String ?image;
    List<dynamic>? option;
    List<dynamic>? download;
    String? quantity;
    String? minimum;
    String? subtract;
    bool ?stock;
    dynamic price;
    dynamic total;
    int ?reward;
    int ?points;
    String ?taxClassId;
    double? weight;
    String? weightClassId;
    String? length;
    String ?width;
    String ?height;
    String? lengthClassId;
    bool? recurring;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        cartId: json["cart_id"],
        productId: json["product_id"],
        name: json["name"],
        model: json["model"],
        shipping: json["shipping"],
        image: json["image"],
        option: List<dynamic>.from(json["option"].map((x) => x)),
        download: List<dynamic>.from(json["download"].map((x) => x)),
        quantity: json["quantity"],
        minimum: json["minimum"],
        subtract: json["subtract"],
        stock: json["stock"],
        price: json["price"],
        total: json["total"],
        reward: json["reward"],
        points: json["points"],
        taxClassId: json["tax_class_id"],
        weight: json["weight"].toDouble(),
        weightClassId: json["weight_class_id"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        lengthClassId: json["length_class_id"],
        recurring: json["recurring"],
    );

    Map<String, dynamic> toJson() => {
        "cart_id": cartId,
        "product_id": productId,
        "name": name,
        "model": model,
        "shipping": shipping,
        "image": image,
        "option": List<dynamic>.from(option!.map((x) => x)),
        "download": List<dynamic>.from(download!.map((x) => x)),
        "quantity": quantity,
        "minimum": minimum,
        "subtract": subtract,
        "stock": stock,
        "price": price,
        "total": total,
        "reward": reward,
        "points": points,
        "tax_class_id": taxClassId,
        "weight": weight,
        "weight_class_id": weightClassId,
        "length": length,
        "width": width,
        "height": height,
        "length_class_id": lengthClassId,
        "recurring": recurring,
    };
}
