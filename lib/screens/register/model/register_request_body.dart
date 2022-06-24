// To parse this JSON data, do
//
//     final registerRequestBody = registerRequestBodyFromJson(jsonString);

import 'dart:convert';

RegisterRequestBody registerRequestBodyFromJson(String str) => RegisterRequestBody.fromJson(json.decode(str));

String registerRequestBodyToJson(RegisterRequestBody data) => json.encode(data.toJson());

class RegisterRequestBody {
    RegisterRequestBody({
        this.firstname,
        this.lastname,
        this.email,
        this.telephone,
        this.password,
        this.confirm,
    });

    String ?firstname;
    String? lastname;
    String? email;
    String ?telephone;
    String? password;
    String ?confirm;

    factory RegisterRequestBody.fromJson(Map<String, dynamic> json) => RegisterRequestBody(
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        telephone: json["telephone"],
        password: json["password"],
        confirm: json["confirm"],
    );

    Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "telephone": telephone,
        "password": password,
        "confirm": confirm,
    };
}
