// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:async';

import 'package:clock_app/configs/size_configs.dart';
import 'package:flutter/material.dart';

class AppDigitalClock extends StatefulWidget {
  const AppDigitalClock({Key? key}) : super(key: key);

  @override
  State<AppDigitalClock> createState() => _AppDigitalClockState();
}

class _AppDigitalClockState extends State<AppDigitalClock> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeOfDay.minute != TimeOfDay.now().minute) {
        setState(() {
          _timeOfDay = TimeOfDay.now();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? 'AM' : 'PM';

    String _hours = ('${_timeOfDay.hourOfPeriod}').padLeft(2, '0');
    String _minutes = ('${_timeOfDay.minute}').padLeft(2, '0');

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${_hours}:${_minutes}",
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(width: 5),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            _period,
            style: TextStyle(fontSize: getProportionateScreenWidth(18)),
          ),
        )
      ],
    );
  }
}
