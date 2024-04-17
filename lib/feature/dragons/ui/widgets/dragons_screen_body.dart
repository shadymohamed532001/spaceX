import 'package:flutter/material.dart';
import 'package:spacex/core/theming/styles.dart';

class DragonsScreenBody extends StatelessWidget {
  const DragonsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Dragons Screen',
          style: AppStyle.font14Blacksemibold,
        ),
        const Row()
      ],
    );
  }
}
