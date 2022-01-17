import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/api_manager.dart';
import 'package:flutter_application_1/models/planet_data_model.dart';

class MarsScreen extends StatefulWidget {
  @override
  _MarsScreenState createState() => _MarsScreenState();
}

class _MarsScreenState extends State<MarsScreen> {
  Future<PlanetData>? _planetData;
  final random = new Random();
  @override
  void initState() {
    _planetData = APIManager().getData();
    super.initState();
  }

  bool isVisible = false;

  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          FutureBuilder<PlanetData>(
            future: _planetData,
            builder: (BuildContext context, snapshot) {
              var data = snapshot.data;
              switch (snapshot.connectionState) {
                // Checking connection
                case ConnectionState.none:
                  return Text('Try reloading the page');
                case ConnectionState.active:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.done:
                  if (snapshot.hasError)
                    return Text('Error: ${snapshot.error}');
                  return Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Image.network(data!.imageThumbnail!.toString()),
                          Text(
                              'The name of Planet shown in above image is ${data.planetName!.toString()}'),
                          if (isVisible)
                            Text(
                                'The distance of earth from sun is ${(data.extra!.distanceToSun! - (data.extra!.distanceToSun! - data.extra!.distanceToEarth!)).toString()}'),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  isVisible = !isVisible;
                                });
                              },
                              child: Icon(Icons.clear)),
                          Text(data.extra!.facts![
                              random.nextInt(data.extra!.facts!.length)]),
                        ],
                      ),
                    ),
                  );
              }
            },
          )
        ],
      ),
    );
  }
}
