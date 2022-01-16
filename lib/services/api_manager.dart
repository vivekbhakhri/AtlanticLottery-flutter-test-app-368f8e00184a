import 'dart:convert';

import 'package:flutter_application_1/services/services.dart';
import 'package:http/http.dart' as http;

class APIManager {
  Future<PlanetData> getData() async {
    var client = http.Client();
    dynamic planetData;

    try{
      var response = await client.get(Uri.parse('https://neonfish.net/mars_api.json'));
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      planetData = PlanetData.fromJson(jsonMap);
    }
    catch(Exception) {
      return planetData;
    }

    return planetData;
  }
}