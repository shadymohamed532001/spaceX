import 'package:flutter/material.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/styles.dart';
import '../widgets/custom_attributes_list_view.dart';
import '../widgets/custom_background.dart';
import '../widgets/custom_properties_row.dart';

class DragonDetailsScreen extends StatelessWidget {
  const DragonDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBackground(
      widget: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Padding(
          padding: const EdgeInsets.only(right: 30.0, left: 30, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dragon1",
                style: AppStyle.font20BlackBold
                    .copyWith(color: ColorManger.whiteColor),
              ),
              const SizedBox(
                height: 30,
              ),
              const CustomAttributesListView(),
              const SizedBox(
                height: 30,
              ),
              const CustomPropertiesRow(
                value: "Feb 06,2018",
                properties: "First start",
              ),
              const CustomPropertiesRow(
                value: "United States",
                properties: "Country",
              ),
              const CustomPropertiesRow(
                value: r"$9.0 mln",
                properties: "Launch cost",
              )
            ],
          ),
        ),
      ),
    );
  }
}
