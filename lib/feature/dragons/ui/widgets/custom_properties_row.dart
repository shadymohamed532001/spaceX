import 'package:flutter/material.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/font_weight_helper.dart';

import '../../../../core/theming/styles.dart';

class CustomPropertiesRow extends StatelessWidget {
  const CustomPropertiesRow({
    super.key,
    required this.properties,
    required this.value,
  });

  final String properties;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            properties,
            style: AppStyle.font14Blacksemibold
                .copyWith(color: ColorManger.whiteColor),
          ),
          Text(
            value,
            style: AppStyle.font14Blacksemibold.copyWith(
                color: ColorManger.whiteColor,
                fontWeight: FontWeightHelper.bold),
          ),
        ],
      ),
    );
  }
}
