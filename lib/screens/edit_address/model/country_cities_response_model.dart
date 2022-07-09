// To parse this JSON data, do
//
//     final countryCityResponseModel = countryCityResponseModelFromJson(jsonString);

import 'dart:convert';

CountryCityResponseModel countryCityResponseModelFromJson(String str) => CountryCityResponseModel.fromJson(json.decode(str));

String countryCityResponseModelToJson(CountryCityResponseModel data) => json.encode(data.toJson());

class CountryCityResponseModel {
    CountryCityResponseModel({
        this.success,
        this.error,
        this.data,
    });

    int? success;
    List<dynamic>? error;
    List<City>? data;

    factory CountryCityResponseModel.fromJson(Map<String, dynamic> json) => CountryCityResponseModel(
        success: json["success"],
        error: List<dynamic>.from(json["error"].map((x) => x)),
        data: List<City>.from(json["data"].map((x) => City.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "error": List<dynamic>.from(error!.map((x) => x)),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class City {
    City({
        this.zoneId,
        this.countryId,
        this.name,
        this.code,
        this.status,
    });

    String? zoneId;
    String ?countryId;
    String ?name;
    String ?code;
    String ?status;

    factory City.fromJson(Map<String, dynamic> json) => City(
        zoneId: json["zone_id"],
        countryId: json["country_id"],
        name: json["name"],
        code: json["code"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "zone_id": zoneId,
        "country_id": countryId,
        "name": name,
        "code": code,
        "status": status,
    };
}
