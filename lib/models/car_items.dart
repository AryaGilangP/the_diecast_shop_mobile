// To parse this JSON data, do
//
//     final carItems = carItemsFromJson(jsonString);

import 'dart:convert';

List<CarItems> carItemsFromJson(String str) => List<CarItems>.from(json.decode(str).map((x) => CarItems.fromJson(x)));

String carItemsToJson(List<CarItems> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarItems {
    String model;
    String pk;
    Fields fields;

    CarItems({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory CarItems.fromJson(Map<String, dynamic> json) => CarItems(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    String price;
    String description;
    String modelNumber;
    String userReviews;
    String imageUrl;

    Fields({
        required this.user,
        required this.name,
        required this.price,
        required this.description,
        required this.modelNumber,
        required this.userReviews,
        required this.imageUrl,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        modelNumber: json["model_number"],
        userReviews: json["user_reviews"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "price": price,
        "description": description,
        "model_number": modelNumber,
        "user_reviews": userReviews,
        "image_url": imageUrl,
    };
}
