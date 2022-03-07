import 'package:clock_app/configs/size_configs.dart';
import 'package:clock_app/shared/themes/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCountryCard extends StatelessWidget {
  const AppCountryCard({
    Key? key,
    required this.country,
    required this.timeZone,
    required this.iconSrc,
    required this.time,
    required this.period,
  }) : super(key: key);

  final String country, timeZone, iconSrc, time, period;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(233),
        child: AspectRatio(
          aspectRatio: 1.2,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).primaryIconTheme.color!,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      ?.copyWith(fontSize: getProportionateScreenWidth(16)),
                ),
                const SizedBox(height: 5),
                Text(timeZone),
                const Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      iconSrc,
                      width: getProportionateScreenWidth(40),
                      color: Theme.of(context).textTheme.bodyText1!.color!,
                    ),
                    const Spacer(),
                    Text(
                      time,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(period),
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
