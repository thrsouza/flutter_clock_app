import 'dart:async';
import 'dart:math';

import 'package:clock_app/configs/size_configs.dart';
import 'package:clock_app/models/app_theme_model.dart';
import 'package:clock_app/shared/themes/app_colors.dart';
import 'package:clock_app/shared/themes/app_icons.dart';
import 'package:clock_app/shared/widgets/app_analog_clock_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class AppAnalogClock extends StatefulWidget {
  const AppAnalogClock({Key? key}) : super(key: key);

  @override
  State<AppAnalogClock> createState() => _AppAnalogClockState();
}

class _AppAnalogClockState extends State<AppAnalogClock> {
  DateTime _dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(30),
            vertical: getProportionateScreenHeight(30),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 0),
                    color: AppColors.shadowColor.withOpacity(0.14),
                    blurRadius: 64,
                  ),
                ],
              ),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: AppAnalogClockPainer(context, _dateTime),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: getProportionateScreenHeight(64),
          left: ((SizeConfig.screenWidth / 2) - 12),
          right: ((SizeConfig.screenWidth / 2) - 12),
          child: Consumer<AppThemeModel>(
            builder: (context, theme, child) => InkWell(
              onTap: () => theme.changeTheme(),
              child: SvgPicture.asset(
                theme.isLightTheme ? AppIcons.sun : AppIcons.moon,
                height: 24,
                width: 24,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
