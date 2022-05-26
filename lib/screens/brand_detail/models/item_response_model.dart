// To parse this JSON data, do
//
//     final itemResponseModel = itemResponseModelFromJson(jsonString);

import 'dart:convert';

ItemResponseModel itemResponseModelFromJson(String str) => ItemResponseModel.fromJson(json.decode(str));

String itemResponseModelToJson(ItemResponseModel data) => json.encode(data.toJson());

class ItemResponseModel {
    ItemResponseModel({
        this.success,
        this.error,
        this.data,
    });

    int ?success;
    List<dynamic>? error;
    Data ?data;

    factory ItemResponseModel.fromJson(Map<String, dynamic> json) => ItemResponseModel(
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
        this.productId,
        this.name,
        this.description,
        this.metaTitle,
        this.metaDescription,
        this.metaKeyword,
        this.tag,
        this.model,
        this.sku,
        this.upc,
        this.ean,
        this.jan,
        this.isbn,
        this.mpn,
        this.location,
        this.quantity,
        this.stockStatus,
        this.image,
        this.manufacturerId,
        this.manufacturer,
        this.price,
        this.special,
        this.reward,
        this.points,
        this.taxClassId,
        this.dateAvailable,
        this.weight,
        this.weightClassId,
        this.length,
        this.width,
        this.height,
        this.lengthClassId,
        this.subtract,
        this.rating,
        this.reviews,
        this.minimum,
        this.sortOrder,
        this.status,
        this.dateAdded,
        this.dateModified,
        this.viewed,
        this.options,
        this.images,
    });

    String? productId;
    String ?name;
    String ?description;
    String ?metaTitle;
    String ?metaDescription;
    String ?metaKeyword;
    String ?tag;
    String ?model;
    String ?sku;
    String ?upc;
    String? ean;
    String? jan;
    String? isbn;
    String? mpn;
    String? location;
    String? quantity;
    String ?stockStatus;
    String ?image;
    dynamic manufacturerId;
    dynamic manufacturer;
    String ?price;
    dynamic special;
    dynamic reward;
    String ?points;
    String ?taxClassId;
    DateTime? dateAvailable;
    String? weight;
    String? weightClassId;
    String?length;
    String ?width;
    String? height;
    String ?lengthClassId;
    String ?subtract;
    int ?rating;
    int ?reviews;
    String ?minimum;
    String ?sortOrder;
    String ?status;
    DateTime? dateAdded;
    DateTime? dateModified;
    String? viewed;
    List<dynamic>? options;
    List<String> ?images;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        productId: json["product_id"],
        name: json["name"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: json["meta_description"],
        metaKeyword: json["meta_keyword"],
        tag: json["tag"],
        model: json["model"],
        sku: json["sku"],
        upc: json["upc"],
        ean: json["ean"],
        jan: json["jan"],
        isbn: json["isbn"],
        mpn: json["mpn"],
        location: json["location"],
        quantity: json["quantity"],
        stockStatus: json["stock_status"],
        image: json["image"],
        manufacturerId: json["manufacturer_id"],
        manufacturer: json["manufacturer"],
        price: json["price"],
        special: json["special"],
        reward: json["reward"],
        points: json["points"],
        taxClassId: json["tax_class_id"],
        dateAvailable: DateTime.parse(json["date_available"]),
        weight: json["weight"],
        weightClassId: json["weight_class_id"],
        length: json["length"],
        width: json["width"],
        height: json["height"],
        lengthClassId: json["length_class_id"],
        subtract: json["subtract"],
        rating: json["rating"],
        reviews: json["reviews"],
        minimum: json["minimum"],
        sortOrder: json["sort_order"],
        status: json["status"],
        dateAdded: DateTime.parse(json["date_added"]),
        dateModified: DateTime.parse(json["date_modified"]),
        viewed: json["viewed"],
        options: List<dynamic>.from(json["options"].map((x) => x)),
        images: List<String>.from(json["images"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaDescription,
        "meta_keyword": metaKeyword,
        "tag": tag,
        "model": model,
        "sku": sku,
        "upc": upc,
        "ean": ean,
        "jan": jan,
        "isbn": isbn,
        "mpn": mpn,
        "location": location,
        "quantity": quantity,
        "stock_status": stockStatus,
        "image": image,
        "manufacturer_id": manufacturerId,
        "manufacturer": manufacturer,
        "price": price,
        "special": special,
        "reward": reward,
        "points": points,
        "tax_class_id": taxClassId,
        "date_available": "${dateAvailable!.year.toString().padLeft(4, '0')}-${dateAvailable!.month.toString().padLeft(2, '0')}-${dateAvailable!.day.toString().padLeft(2, '0')}",
        "weight": weight,
        "weight_class_id": weightClassId,
        "length": length,
        "width": width,
        "height": height,
        "length_class_id": lengthClassId,
        "subtract": subtract,
        "rating": rating,
        "reviews": reviews,
        "minimum": minimum,
        "sort_order": sortOrder,
        "status": status,
        "date_added": dateAdded!.toIso8601String(),
        "date_modified": dateModified!.toIso8601String(),
        "viewed": viewed,
        "options": List<dynamic>.from(options!.map((x) => x)),
        "images": List<dynamic>.from(images!.map((x) => x)),
    };
}
