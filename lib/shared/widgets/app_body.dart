import 'package:clock_app/shared/themes/app_icons.dart';
import 'package:clock_app/shared/widgets/app_analog_clock.dart';
import 'package:clock_app/shared/widgets/app_country_card.dart';
import 'package:clock_app/shared/widgets/app_digital_clock.dart';
import 'package:flutter/material.dart';

class AppBody extends StatelessWidget {
  const AppBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "Londrina PR, BRAZIL",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const AppDigitalClock(),
            const Spacer(),
            const AppAnalogClock(),
            const Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  AppCountryCard(
                    country: 'New York, USA',
                    timeZone: '+3 HRS | EST',
                    iconSrc: AppIcons.liberty,
                    time: '09:20',
                    period: 'PM',
                  ),
                  AppCountryCard(
                    country: 'Sydney, AU',
                    timeZone: '+19 HRS | AEST',
                    iconSrc: AppIcons.sydney,
                    time: '01:20',
                    period: 'AM',
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
