import 'package:flutter/material.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/styles.dart';

class RocketInfoDetails extends StatelessWidget {
  const RocketInfoDetails({
    super.key,
    required this.subtitle,
    required this.title,
  });

  final String subtitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManger.greyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: AppStyle.font18Whitesemibold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              subtitle,
              style: TextStyle(
                fontSize: 15,
                color: ColorManger.whiteColor.withOpacity(0.4),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
