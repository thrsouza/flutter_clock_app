import 'dart:math';

import 'package:flutter/material.dart';

class AppAnalogClockPainer extends CustomPainter {
  final BuildContext context;
  final DateTime dateTime;

  AppAnalogClockPainer(
    this.context,
    this.dateTime,
  );

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);

    Color backgroundColor = Theme.of(context).backgroundColor;
    Color primaryColor = Theme.of(context).primaryColor;
    Color primaryIconThemeColor = Theme.of(context).primaryIconTheme.color!;
    Color secundaryColor = Theme.of(context).colorScheme.secondary;
    Color bodyTextColorLight = Theme.of(context).textTheme.bodyText1!.color!;

    // minutes calculation
    // - dateTime.hour * 30 because 360 / 12 = 30;
    // - dateTime.minute * 0.5 each minute we want to turn our hour pointer a little
    double minuteX =
        centerX + size.width * 0.4 * cos((dateTime.minute * 6) * pi / 180);

    double minuteY =
        centerY + size.width * 0.4 * sin((dateTime.minute * 6) * pi / 180);

    // minutes pointer
    canvas.drawLine(
      center,
      Offset(minuteX, minuteY),
      Paint()
        ..color = bodyTextColorLight
        ..style = PaintingStyle.stroke
        ..strokeWidth = 8,
    );

    // hours calculation
    // - dateTime.hour * 30 because 360 / 12 = 30;
    // - dateTime.minute * 0.5 each minute we want to turn our hour pointer a little
    double hourX = centerX +
        size.width *
            0.3 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    double hourY = centerY +
        size.width *
            0.3 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    // hours pointer
    canvas.drawLine(
      center,
      Offset(hourX, hourY),
      Paint()
        ..color = secundaryColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10,
    );

    // seconds calculation
    // - size.width * 0.4 define our line height;
    // - dateTime.second * 6 because 360 / 60 = 6;
    double secondX =
        centerX + size.width * 0.45 * cos((dateTime.second * 6) * pi / 180);
    double secondY =
        centerY + size.width * 0.45 * sin((dateTime.second * 6) * pi / 180);

    // seconds pointer
    canvas.drawLine(
      center,
      Offset(secondX, secondY),
      Paint()
        ..color = primaryColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2,
    );

    // center dots
    canvas.drawCircle(center, 24, Paint()..color = primaryIconThemeColor);
    canvas.drawCircle(center, 23, Paint()..color = backgroundColor);
    canvas.drawCircle(center, 10, Paint()..color = primaryIconThemeColor);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
