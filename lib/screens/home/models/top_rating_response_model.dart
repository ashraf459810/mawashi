// To parse this JSON data, do
//
//     final topRatingResponseModel = topRatingResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:dellyshop/screens/brand_detail/models/category_items_response_model.dart';

TopRatingResponseModel topRatingResponseModelFromJson(String str) => TopRatingResponseModel.fromJson(json.decode(str));

String topRatingResponseModelToJson(TopRatingResponseModel data) => json.encode(data.toJson());

class TopRatingResponseModel {
    TopRatingResponseModel({
        this.success,
        this.error,
        this.data,
    });

    int ?success;
    List<dynamic> ?error;
    List<Item> ?data;

    factory TopRatingResponseModel.fromJson(Map<String, dynamic> json) => TopRatingResponseModel(
        success: json["success"],
        error: List<dynamic>.from(json["error"].map((x) => x)),
        data: List<Item>.from(json["data"].map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "error": List<dynamic>.from(error!.map((x) => x)),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}



