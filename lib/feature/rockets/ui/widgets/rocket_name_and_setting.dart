import 'package:flutter/material.dart';
import 'package:spacex/core/theming/styles.dart';
import 'package:spacex/feature/rockets/data/model/reocket_model.dart';

class RocketNameAndSetting extends StatelessWidget {
  const RocketNameAndSetting({
    super.key,
    required this.rocketModel,
  });

  final RocketModel rocketModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Row(
        children: [
          Text(
            rocketModel.name,
            style: AppStyle.font18Whitesemibold,
          ),
          const Spacer(),
          const Icon(
            Icons.settings,
            size: 28,
          )
        ],
      ),
    );
  }
}
