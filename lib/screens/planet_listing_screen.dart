import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/planet_listing_model.dart';
import 'package:flutter_application_1/widgets/planet_display.dart';
import 'package:flutter_application_1/widgets/todays_display.dart';

class PlanetListingScreen extends StatefulWidget {
  const PlanetListingScreen({Key? key}) : super(key: key);

  @override
  State<PlanetListingScreen> createState() => _PlanetListingScreenState();
}

/// This is the private State class that goes with PlanetListingScreen.
class _PlanetListingScreenState extends State<PlanetListingScreen> {
  Future<PlanetDisplay>? _planetDisplay;
  PlanetListingModel model = PlanetListingModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TodaysDisplay(date: model.getFormattedDate()),
          Center(
              //E.g. - use ListView.builder & the PlanetDisplay Widget to show the list above!
            child: ListView.builder(itemBuilder: (context, index){

            })
              ),
        ],
      ),
    );
  }
}
