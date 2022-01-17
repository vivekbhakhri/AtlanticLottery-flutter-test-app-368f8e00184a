import 'package:clock/clock.dart';
import 'package:flutter_application_1/models/planet_listing_model.dart';
bool test(){
  PlanetListingModel model = PlanetListingModel();
  DateTime dumTime= clock.now();
  DateTime appTime = DateTime.parse(model.getFormattedDate());

  bool result = PlanetListingModel().isSameTimeOfDay(dumTime, dumTime);
  return result;


}



