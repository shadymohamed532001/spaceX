import 'package:flutter/material.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/styles.dart';

class CustomRocketDetialsRow extends StatelessWidget {
  const CustomRocketDetialsRow({
    super.key,
    required this.subtitle,
    required this.title,
  });

  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyle.font14Whitesemibold,
          ),
          Text(
            subtitle,
            style: AppStyle.font14Whitesemibold.copyWith(
              color: ColorManger.greyColor.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}
