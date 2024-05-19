import 'package:flutter/material.dart';
import 'package:spacex/core/theming/styles.dart';

class DiscrptionWidgets extends StatelessWidget {
  const DiscrptionWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Description',
      style: AppStyle.font18Whitesemibold,
    );
  }
}
