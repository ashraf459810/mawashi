// To parse this JSON data, do
//
//     final categoriesResponseModel = categoriesResponseModelFromJson(jsonString);

import 'dart:convert';

CategoriesResponseModel categoriesResponseModelFromJson(String str) => CategoriesResponseModel.fromJson(json.decode(str));

String categoriesResponseModelToJson(CategoriesResponseModel data) => json.encode(data.toJson());

class CategoriesResponseModel {
    CategoriesResponseModel({
        this.success,
        this.error,
        this.data,
    });

    int? success;
    List<dynamic>? error;
    List<Datum> ?data;

    factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) => CategoriesResponseModel(
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
        this.id,
        this.description,
        this.count,
        this.name,
        this.image,
        this.parent,
        this.icon

    });

    String ?id;
    String ? icon;
    String ?description;
    String ?count;
    String ?name;
    String ?image;
    String ?parent;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
      icon: json["icon"],
        id: json["id"],
        description: json["description"],
        count: json["count"],
        name: json["name"],
        image: json["image"],
        parent: json["parent"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "count": count,
        "name": name,
        "image": image,
        "parent": parent,
    };
}
