import 'package:flutter/material.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/styles.dart';
import 'package:spacex/feature/dragons/data/models/DragonModel.dart';
import 'package:spacex/feature/dragons/ui/widgets/dragon_info_section.dart';

import '../widgets/custom_attributes_list_view.dart';
import '../widgets/custom_background.dart';

class DragonDetailsScreen extends StatelessWidget {
  const DragonDetailsScreen({super.key, required this.dragonModel});

  final DragonModel dragonModel;

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      dragonModel: dragonModel,
      widget: Padding(
        padding: const EdgeInsets.only(right: 30.0, left: 30, top: 50),
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dragonModel.name ?? "",
                style: AppStyle.font20BlackBold
                    .copyWith(color: ColorManger.whiteColor),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomAttributesListView(
                dragonModel: dragonModel,
              ),
              const SizedBox(
                height: 30,
              ),
              DragonInfoSection(dragonModel: dragonModel),
            ],
          ),
        ),
      ),
    );
  }
}
