import 'package:flutter/material.dart';

import '../../data/models/DragonModel.dart';
import 'custom_attribute_container.dart';

class CustomAttributesListView extends StatelessWidget {
  const CustomAttributesListView({
    super.key,
    required this.dragonModel,
  });

  final DragonModel dragonModel;

  static const List<String> value = [
    "size_meters",
    "temp_degree",
    "height",
    "diameter",
    "thrust",
    "solar_array"
  ];

  @override
  Widget build(BuildContext context) {
    List keys = [
      dragonModel.heatShield?.sizeMeters.toString() ?? "",
      dragonModel.heatShield?.tempDegrees.toString() ?? "",
      dragonModel.heightWTrunk?.meters.toString() ?? "",
      dragonModel.diameter?.meters.toString() ?? "",
      dragonModel.thrusters![0].thrust?.kN.toString() ?? "",
      dragonModel.trunk?.cargo?.solarArray.toString() ?? "",
    ];
    return SizedBox(
      height: 90,
      child: ListView.builder(
          itemCount: value.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return CustomAttributesContainer(
              value: value[index],
              valueKey: keys[index],
            );
          }),
    );
  }
}
