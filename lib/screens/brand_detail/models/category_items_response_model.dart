// To parse this JSON data, do
//
//     final categoryItemsResponseModel = categoryItemsResponseModelFromJson(jsonString);

import 'dart:convert';



CategoryItemsResponseModel categoryItemsResponseModelFromJson(String str) => CategoryItemsResponseModel.fromJson(json.decode(str));


String categoryItemsResponseModelToJson(CategoryItemsResponseModel data) => json.encode(data.toJson());

class CategoryItemsResponseModel {
    CategoryItemsResponseModel({
        this.success,
        this.error,
        this.data,
    });

    int ?success;
    List<dynamic>? error;
    List<Item> ?data;

    factory CategoryItemsResponseModel.fromJson(Map<String, dynamic> json) => CategoryItemsResponseModel(
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

class Item {
    Item({
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
    Meta? metaDescription;
    Meta ?metaKeyword;
    String? tag;
    String? model;
    String? sku;
    String ?upc;
    String? ean;
    String? jan;
    String? isbn;
    String? mpn;
    String? location;
    String? quantity;
    StockStatus ?stockStatus;
    String ?image;
    String? manufacturerId;
    String? manufacturer;
    String? price;
    String ?special;
    dynamic reward;
    String ?points;
    String ?taxClassId;
    DateTime? dateAvailable;
    String ?weight;
    String ?weightClassId;
    String? length;
    String? width;
    String? height;
    String? lengthClassId;
    String? subtract;
    int? rating;
    int ?reviews;
    String? minimum;
    String ?sortOrder;
    String ?status;
    DateTime? dateAdded;
    DateTime? dateModified;
    String ?viewed;
    List<Option>? options;
    List<String>? images;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        productId: json["product_id"],
        name: json["name"],
        description: json["description"],
        metaTitle: json["meta_title"],
        metaDescription: metaValues.map[json["meta_description"]],
        metaKeyword: metaValues.map[json["meta_keyword"]],
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
        stockStatus: stockStatusValues.map[json["stock_status"]],
        image: json["image"],
        manufacturerId: json["manufacturer_id"] == null ? null : json["manufacturer_id"],
        manufacturer: json["manufacturer"] == null ? null : json["manufacturer"],
        price: json["price"],
        special: json["special"] == null ? null : json["special"],
        reward: json["reward"],
        points: json["points"],
        taxClassId: json["tax_class_id"],
        dateAvailable: json["date_available"]!=null? DateTime.parse(json["date_available"]): json["date_available"],
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
    
     
        viewed: json["viewed"],
        options: json["options"]!=null? List<Option>.from(json["options"].map((x) => Option.fromJson(x))):null,
        images:  json["images"]!=null? List<String>.from(json["images"].map((x) => x)):null,
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "description": description,
        "meta_title": metaTitle,
        "meta_description": metaValues.reverse[metaDescription],
        "meta_keyword": metaValues.reverse[metaKeyword],
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
        "stock_status": stockStatusValues.reverse[stockStatus],
        "image": image,
        "manufacturer_id": manufacturerId == null ? null : manufacturerId,
        "manufacturer": manufacturer == null ? null : manufacturer,
        "price": price,
        "special": special == null ? null : special,
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
        "options": List<dynamic>.from(options!.map((x) => x.toJson())),
        "images": List<dynamic>.from(images!.map((x) => x)),
    };
}

enum Meta { EMPTY, META, THE_1513 }

final metaValues = EnumValues({
    "": Meta.EMPTY,
    "بوكس باربيكيو": Meta.META,
    "خروف رفيدي صغير  اللحم الصافي: 15-13 كغ": Meta.THE_1513
});

class Option {
    Option({
        this.productOptionId,
        this.productOptionValue,
        this.optionId,
        this.name,
        this.type,
        this.value,
        this.required,
    });

    String? productOptionId;
    List<ProductOptionValue> ?productOptionValue;
    String ?optionId;
    String ?name;
    String ?type;
    String ?value;
    String ?required;

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        productOptionId: json["product_option_id"],
        productOptionValue: List<ProductOptionValue>.from(json["product_option_value"].map((x) => ProductOptionValue.fromJson(x))),
        optionId: json["option_id"],
        name: json["name"],
        type: json["type"],
        value: json["value"],
        required: json["required"],
    );

    Map<String, dynamic> toJson() => {
        "product_option_id": productOptionId,
        "product_option_value": List<dynamic>.from(productOptionValue!.map((x) => x.toJson())),
        "option_id": optionId,
        "name": name,
        "type": type,
        "value": value,
        "required": required,
    };
}

class ProductOptionValue {
    ProductOptionValue({
        this.productOptionValueId,
        this.optionValueId,
        this.name,
        this.image,
        this.quantity,
        this.subtract,
        this.price,
        this.pricePrefix,
        this.weight,
        this.weightPrefix,
    });

    String ?productOptionValueId;
    String ?optionValueId;
    String ?name;
    String ?image;
    String ?quantity;
    String ?subtract;
    String ?price;
    Prefix ?pricePrefix;
    String ?weight;
    Prefix? weightPrefix;

    factory ProductOptionValue.fromJson(Map<String, dynamic> json) => ProductOptionValue(
        productOptionValueId: json["product_option_value_id"],
        optionValueId: json["option_value_id"],
        name: json["name"],
        image: json["image"],
        quantity: json["quantity"],
        subtract: json["subtract"],
        price: json["price"],
        pricePrefix: prefixValues.map[json["price_prefix"]],
        weight: json["weight"],
        weightPrefix: prefixValues.map[json["weight_prefix"]],
    );

    Map<String, dynamic> toJson() => {
        "product_option_value_id": productOptionValueId,
        "option_value_id": optionValueId,
        "name": name,
        "image": image,
        "quantity": quantity,
        "subtract": subtract,
        "price": price,
        "price_prefix": prefixValues.reverse[pricePrefix],
        "weight": weight,
        "weight_prefix": prefixValues.reverse[weightPrefix],
    };
}

enum Prefix { EMPTY, PREFIX }

final prefixValues = EnumValues({
    "+": Prefix.EMPTY,
    "-": Prefix.PREFIX
});

enum StockStatus { OUT_OF_STOCK, IN_STOCK }

final stockStatusValues = EnumValues({
    "In Stock": StockStatus.IN_STOCK,
    "Out Of Stock": StockStatus.OUT_OF_STOCK
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> ?reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap!;
    }
}
