import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_manager.dart';

import 'package:http/http.dart' as http;

// To parse this JSON data, do
//
//     final planetData = planetDataFromJson(jsonString);

import 'dart:convert';

PlanetData planetDataFromJson(String str) => PlanetData.fromJson(json.decode(str));

String planetDataToJson(PlanetData data) => json.encode(data.toJson());


class PlanetData {

  PlanetData({
    this.planetName,
    this.diameter,
    this.imageThumbnail,
    this.extra,
  });

  String? planetName;
  int? diameter;
  String? imageThumbnail;
  Extra? extra;

  factory PlanetData.fromJson(Map<String, dynamic> json) => PlanetData(
    planetName: json["planetName"],
    diameter: json["diameter"],
    imageThumbnail: json["imageThumbnail"],
    extra: Extra.fromJson(json["extra"]),
  );

  Map<String, dynamic> toJson() => {
    "planetName": planetName,
    "diameter": diameter,
    "imageThumbnail": imageThumbnail,
    "extra": extra!.toJson(),
  };
}

class Extra {
  Extra({
    this.distanceToSun,
    this.distanceToEarth,
    this.facts,
  });

  int? distanceToSun;
  int? distanceToEarth;
  List<String>? facts;

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
    distanceToSun: json["distanceToSun"],
    distanceToEarth: json["distanceToEarth"],
    facts: List<String>.from(json["facts"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "distanceToSun": distanceToSun,
    "distanceToEarth": distanceToEarth,
    "facts": List<dynamic>.from(facts!.map((x) => x)),
  };
}
