import 'dart:convert';

import 'package:submission_proyek1/data/model/drink_model.dart';
import 'package:submission_proyek1/data/model/food_model.dart';

class Menus {
  final List<Food> foods;
  final List<Drink> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromRawJson(String str) => Menus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods: List<Food>.from(json["foods"].map((x) => Food.fromJson(x))),
        drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
        "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
      };
}
