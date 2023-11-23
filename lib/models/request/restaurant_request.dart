
import 'dart:convert';

RestaurantRequestModel restaurantRequestModelFromJson(String str) => RestaurantRequestModel.fromJson(json.decode(str));

String restaurantRequestModelToJson(RestaurantRequestModel data) => json.encode(data.toJson());

class RestaurantRequestModel {
  DataRequest data;

  RestaurantRequestModel({
    required this.data,
  });

  factory RestaurantRequestModel.fromJson(Map<String, dynamic> json) => RestaurantRequestModel(
    data: DataRequest.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class DataRequest {
  String name;
  String category;
  int discount;
  double deliveryFee;
  int deliveryTime;
  String picture;

  DataRequest({
    required this.name,
    required this.category,
    required this.discount,
    required this.deliveryFee,
    required this.deliveryTime,
    required this.picture,
  });

  factory DataRequest.fromJson(Map<String, dynamic> json) => DataRequest(
    name: json["name"],
    category: json["category"],
    discount: json["discount"],
    deliveryFee: json["deliveryFee"]?.toDouble(),
    deliveryTime: json["deliveryTime"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "category": category,
    "discount": discount,
    "deliveryFee": deliveryFee,
    "deliveryTime": deliveryTime,
    "picture": picture,
  };
}
