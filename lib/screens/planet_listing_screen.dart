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


  void initState() {
    model.listSort(); //Sorts planetsList in descending order

    super.initState();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TodaysDisplay(date: model.getFormattedDate()),


          Center(
              //E.g. - use ListView.builder & the PlanetDisplay Widget to show the list above!
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: model.planetsList.length,
                itemBuilder: (context, itemCount){
                  return ListTile(
                    title:Text('Name=> ${model.planetsList[itemCount].name} - Radius=> ${model.planetsList[itemCount].radius}'),
                  );
            })
          ),
        ],
      ),
    );
  }
}
