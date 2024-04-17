import 'package:flutter/material.dart';
import 'package:spacex/core/theming/styles.dart';

class LunchesScreenBody extends StatelessWidget {
  const LunchesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Lunches Screen',
          style: AppStyle.font14Blacksemibold,
        ),
        const Row()
      ],
    );
  }
}
