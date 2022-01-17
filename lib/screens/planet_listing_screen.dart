import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/planet_listing_model.dart';
import 'package:flutter_application_1/widgets/todays_display.dart';


class PlanetListingScreen extends StatefulWidget {
  const PlanetListingScreen({Key? key}) : super(key: key);

  @override
  State<PlanetListingScreen> createState() => _PlanetListingScreenState();

}

/// This is the private State class that goes with PlanetListingScreen.
class _PlanetListingScreenState extends State<PlanetListingScreen> {

  PlanetListingModel model = PlanetListingModel();


  Widget build(BuildContext context) {
    const _planet = PlanetListingScreen();
    return Scaffold(
      body: Column(
        children: [
          AnimatedOpacity(opacity: 1.0, duration: Duration(milliseconds: 10000),
          child: TodaysDisplay(date: model.getFormattedDate()),
          ),

          Center(
              //E.g. - use ListView.builder & the PlanetDisplay Widget to show the list above!
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: model.planetsList.length,
                itemBuilder: (context, itemCount){
                  return ListTile(
                    title: Text(model.planetsList.sorted()),
                  );
            })
          ),
        ],
      ),
    );
  }
}
