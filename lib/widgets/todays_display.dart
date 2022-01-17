import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodaysDisplay extends StatefulWidget {
  final String? date;
  const TodaysDisplay({
    Key? key,
    this.date,
  }) : super(key: key);

  @override
  State<TodaysDisplay> createState() => _TodaysDisplayState();
}

/// This is the private State class that goes with TodaysDisplay.
class _TodaysDisplayState extends State<TodaysDisplay> {
  late Timer _timer;
  bool show = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        show = !show;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.grey),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      child: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: show ? 1.0 :0.0,
        child: Text(DateFormat('MM-DD-yyyy hh:mm:ss a').format(DateTime.parse(widget.date!))),
      ),
    );
  }
}
