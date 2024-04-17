import 'package:flutter/material.dart';
import 'package:spacex/core/theming/styles.dart';

class RocketsScreenBody extends StatelessWidget {
  const RocketsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Rockets Screen',
          style: AppStyle.font14Blacksemibold,
        ),
        const Row()
      ],
    );
  }
}
