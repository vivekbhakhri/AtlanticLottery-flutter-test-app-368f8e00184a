import 'package:clock/clock.dart';
import 'package:flutter_application_1/models/planet_listing_model.dart';
import 'package:flutter_application_1/models/planet_model.dart';

bool isSameTimeOfDayTest() {
  PlanetListingModel model = PlanetListingModel();
  DateTime dumTime = clock.now();
  DateTime appTime = DateTime.parse(model.getFormattedDate());
  bool result = PlanetListingModel().isSameTimeOfDay(dumTime, appTime);
  return result;
}

List<Planet> filterPlanetsByMinRadiusTest() {
  PlanetListingModel model = PlanetListingModel();
  var list = model.planetsList;
  double minRadius = 2439.7;
  var result = model.filterPlanetsByMinRadius(list, minRadius);
  return result;
}

void main() {
  print(isSameTimeOfDayTest());
  print(filterPlanetsByMinRadiusTest());
}
