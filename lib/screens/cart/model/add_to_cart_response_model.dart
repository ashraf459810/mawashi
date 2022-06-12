// To parse this JSON data, do
//
//     final addToCartResponseModel = addToCartResponseModelFromJson(jsonString);

import 'dart:convert';

AddToCartResponseModel addToCartResponseModelFromJson(String str) => AddToCartResponseModel.fromJson(json.decode(str));

String addToCartResponseModelToJson(AddToCartResponseModel data) => json.encode(data.toJson());

class AddToCartResponseModel {
    AddToCartResponseModel({
        this.success,
        this.error,
        this.session,
        this.data,
    });

    int ?success;
    List<dynamic>? error;
    String ?session;
    Data ?data;

    factory AddToCartResponseModel.fromJson(Map<String, dynamic> json) => AddToCartResponseModel(
        success: json["success"],
        error: List<dynamic>.from(json["error"].map((x) => x)),
        session: json["session"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "error": List<dynamic>.from(error!.map((x) => x)),
        "session": session,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        required this.totalProductCount,
    });

    int totalProductCount;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        totalProductCount: json["total_product_count"],
    );

    Map<String, dynamic> toJson() => {
        "total_product_count": totalProductCount,
    };
}
