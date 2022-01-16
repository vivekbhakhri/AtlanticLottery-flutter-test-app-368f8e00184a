import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:flutter_application_1/services/api_manager.dart';
import 'package:flutter_application_1/services/services.dart';

class MarsScreen extends StatefulWidget {
  @override
  _MarsScreenState createState() => _MarsScreenState();
}

class _MarsScreenState extends State<MarsScreen> {
  Future<PlanetData>? _planetData;

  @override
  void initState() {
    _planetData = API_Manager().getData();
    super.initState();
  }

  final textList = Container(
    child: Center(
      child: Row(
        children: [],
      ),
    ),
  );

  Widget build(BuildContext context) {
    print('marsBuild');
    return FutureBuilder<PlanetData>(
      future: _planetData,
      builder: (BuildContext context, snapshot) {
        var data = snapshot.data;
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('Press button to start.');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.done:
            if (snapshot.hasError) return Text('Error: ${snapshot.error}');
            return Center(
              child: Container(

                height: 1000,
                child: Column(
                  children: <Widget>[
                    Image.network(data!.imageThumbnail!.toString()),
                    Text(data.planetName.toString()),
                    Text(data.extra!.facts!.toString()),
                  ],
                ),
              ),
            );
            break;
        }
        return Center(child: CircularProgressIndicator()); // unreachable
      },
    );
  }
}
