// To parse this JSON data, do
//
//     final registerResponseModel = registerResponseModelFromJson(jsonString);

import 'dart:convert';

RegisterResponseModel registerResponseModelFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String registerResponseModelToJson(RegisterResponseModel data) => json.encode(data.toJson());

class RegisterResponseModel {
    RegisterResponseModel({
        this.success,
        this.error,
        this.data,
    });

    int? success;
    List<dynamic> ?error;
    Data? data;

    factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
        success: json["success"],
        error: List<dynamic>.from(json["error"].map((x) => x)),
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "error": List<dynamic>.from(error!.map((x) => x)),
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.customerId,
        this.customerGroupId,
        this.storeId,
        this.languageId,
        this.firstname,
        this.lastname,
        this.email,
        this.telephone,
        this.fax,
        this.password,
        this.salt,
        this.cart,
        this.wishlist,
        this.newsletter,
        this.addressId,
        this.customField,
        this.ip,
        this.status,
        this.safe,
        this.token,
        this.code,
        this.dateAdded,
        this.image,
    });

    String ?customerId;
    String ?customerGroupId;
    String ?storeId;
    String ?languageId;
    String ?firstname;
    String ?lastname;
    String? email;
    String? telephone;
    String ?fax;
    String ?password;
    String ?salt;
    dynamic cart;
    dynamic wishlist;
    String ?newsletter;
    String ?addressId;
    String ?customField;
    String ?ip;
    String ?status;
    String ?safe;
    String ?token;
    String ?code;
    DateTime? dateAdded;
    String ?image;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        customerId: json["customer_id"],
        customerGroupId: json["customer_group_id"],
        storeId: json["store_id"],
        languageId: json["language_id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        telephone: json["telephone"],
        fax: json["fax"],
        password: json["password"],
        salt: json["salt"],
        cart: json["cart"],
        wishlist: json["wishlist"],
        newsletter: json["newsletter"],
        addressId: json["address_id"],
        customField: json["custom_field"],
        ip: json["ip"],
        status: json["status"],
        safe: json["safe"],
        token: json["token"],
        code: json["code"],
        dateAdded: DateTime.parse(json["date_added"]),
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "customer_group_id": customerGroupId,
        "store_id": storeId,
        "language_id": languageId,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "telephone": telephone,
        "fax": fax,
        "password": password,
        "salt": salt,
        "cart": cart,
        "wishlist": wishlist,
        "newsletter": newsletter,
        "address_id": addressId,
        "custom_field": customField,
        "ip": ip,
        "status": status,
        "safe": safe,
        "token": token,
        "code": code,
        "date_added": dateAdded!.toIso8601String(),
        "image": image,
    };
}
