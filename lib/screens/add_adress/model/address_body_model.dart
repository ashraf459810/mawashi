// To parse this JSON data, do
//
//     final addressBodyModel = addressBodyModelFromJson(jsonString);

import 'dart:convert';

AddressBodyModel addressBodyModelFromJson(String str) => AddressBodyModel.fromJson(json.decode(str));

String addressBodyModelToJson(AddressBodyModel data) => json.encode(data.toJson());

class AddressBodyModel {
    AddressBodyModel({
        this.firstname,
        this.lastname,
        this.city,
        this.address1,
        this.address2,
        this.countryId,
        this.postcode,
        this.zoneId,
        this.email,
        this.telephone,
        this.session,
    });

    String ?firstname;
    String ?lastname;
    String ?city;
    String ?address1;
    String ?address2;
    String? countryId;
    String? postcode;
    String? zoneId;
    String? email;
    String? telephone;
    String? session;

    factory AddressBodyModel.fromJson(Map<String, dynamic> json) => AddressBodyModel(
        firstname: json["firstname"],
        lastname: json["lastname"],
        city: json["city"],
        address1: json["address_1"],
        address2: json["address_2"],
        countryId: json["country_id"],
        postcode: json["postcode"],
        zoneId: json["zone_id"],
        email: json["email"],
        telephone: json["telephone"],
        session: json["session"],
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "city": city,
        "address_1": address1,
        "address_2": address2,
        "country_id": countryId,
        "postcode": postcode,
        "zone_id": zoneId,
        "email": email,
        "telephone": telephone,
        "session": session,
    };
}
