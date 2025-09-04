// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromJson(jsonString);

import 'dart:convert';

CategoryResponse categoryResponseFromJson(String str) =>
    CategoryResponse.fromJson(json.decode(str));

String categoryResponseToJson(CategoryResponse data) =>
    json.encode(data.toJson());

class CategoryResponse {
  String? message;
  Data? data;

  CategoryResponse({this.message, this.data});

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      CategoryResponse(
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {"message": message, "data": data?.toJson()};
}

class Data {
  String? name;
  String? image;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data({this.name, this.image, this.updatedAt, this.createdAt, this.id});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    image: json["image"],
    updatedAt: json["updated_at"],
    createdAt: json["created_at"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "image": image,
    "updated_at": updatedAt,
    "created_at": createdAt,
    "id": id,
  };
}
