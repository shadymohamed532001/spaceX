import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/DragonModel.dart';
import 'custom_properties_row.dart';

class DragonInfoSection extends StatelessWidget {
  const DragonInfoSection({super.key, required this.dragonModel});

  final DragonModel dragonModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Description : ",
              style: AppStyle.font14Blacksemibold
                  .copyWith(color: ColorManger.whiteColor),
            ),
            Text(
              dragonModel.description ?? "",
              style: AppStyle.font14Blacksemibold
                  .copyWith(color: ColorManger.whiteColor.withOpacity(0.4)),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
        CustomPropertiesRow(
          value: dragonModel.firstFlight ?? "",
          properties: "First flight",
        ),
        CustomPropertiesRow(
          value: dragonModel.type ?? "",
          properties: "Type",
        ),
        CustomPropertiesRow(
          value: dragonModel.active.toString(),
          properties: "Active",
        ),
        CustomPropertiesRow(
          value: dragonModel.heatShield?.material ?? "",
          properties: "Material",
        ),
        CustomPropertiesRow(
          value: dragonModel.heatShield?.devPartner ?? "",
          properties: "Dev partner",
        ),
        CustomPropertiesRow(
          value: dragonModel.dryMassKg.toString(),
          properties: "Dry Mass Kg",
        ),
        CustomPropertiesRow(
          value: dragonModel.dryMassLb.toString(),
          properties: "Dry Mass Lb",
        ),
      ],
    );
  }
}
