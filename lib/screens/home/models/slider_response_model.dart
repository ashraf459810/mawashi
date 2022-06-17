// To parse this JSON data, do
//
//     final sliderResponseModel = sliderResponseModelFromJson(jsonString);

import 'dart:convert';

SliderResponseModel sliderResponseModelFromJson(String str) => SliderResponseModel.fromJson(json.decode(str));

String sliderResponseModelToJson(SliderResponseModel data) => json.encode(data.toJson());

class SliderResponseModel {
    SliderResponseModel({
        this.success,
        this.error,
        this.data,
    });

    int? success;
    List<dynamic> ?error;
    List<Slider> ?data;

    factory SliderResponseModel.fromJson(Map<String, dynamic> json) => SliderResponseModel(
        success: json["success"],
        error: List<dynamic>.from(json["error"].map((x) => x)),
        data: List<Slider>.from(json["data"].map((x) => Slider.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "error": List<dynamic>.from(error!.map((x) => x)),
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Slider {
    Slider({
        this.url,
        this.type,
        this.id,
        this.name,
    });

    String ?url;
    String? type;
    String ?id;
    String ?name;

    factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        url: json["url"],
        type: json["type"],
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "type": type,
        "id": id,
        "name": name,
    };
}
