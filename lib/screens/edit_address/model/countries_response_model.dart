// To parse this JSON data, do
//
//     final countriesResponseModel = countriesResponseModelFromJson(jsonString);

import 'dart:convert';

CountriesResponseModel countriesResponseModelFromJson(String str) => CountriesResponseModel.fromJson(json.decode(str));

String countriesResponseModelToJson(CountriesResponseModel data) => json.encode(data.toJson());

class CountriesResponseModel {
    CountriesResponseModel({
        this.success,
        this.error,
        this.data,
    });

    int ?success;
    List<dynamic> ?error;
    List<Country> ?data;

    factory CountriesResponseModel.fromJson(Map<String, dynamic> json) => CountriesResponseModel(
        success: json["success"],
        error: List<dynamic>.from(json["error"].map((x) => x)),
        data: List<Country>.from(json["data"].map((x) => Country.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "error": List<dynamic>.from(error!.map((x) => x)),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Country {
    Country({
        this.countryId,
        this.name,
        this.isoCode2,
        this.isoCode3,
        this.addressFormat,
        this.postcodeRequired,
        this.status,
    });

    String ?countryId;
    String ?name;
    String ?isoCode2;
    String ?isoCode3;
    String ?addressFormat;
    String ?postcodeRequired;
    String ?status;

    factory Country.fromJson(Map<String, dynamic> json) => Country(
        countryId: json["country_id"],
        name: json["name"],
        isoCode2: json["iso_code_2"],
        isoCode3: json["iso_code_3"],
        addressFormat: json["address_format"],
        postcodeRequired: json["postcode_required"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "country_id": countryId,
        "name": name,
        "iso_code_2": isoCode2,
        "iso_code_3": isoCode3,
        "address_format": addressFormat,
        "postcode_required": postcodeRequired,
        "status": status,
    };
}
