import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spacex/core/helpers/spacing.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/styles.dart';
import 'package:spacex/feature/rockets/data/model/reocket_model.dart';
import 'package:spacex/feature/lunches/ui/widgets/custom_detials_row.dart';
import 'package:spacex/feature/rockets/ui/widgets/discrption_widgets.dart';
import 'package:spacex/feature/rockets/ui/widgets/rocket_info_details.dart';
import 'package:spacex/feature/rockets/ui/widgets/rocket_name_and_setting.dart';

class RocketDetailBottomSheet extends StatelessWidget {
  const RocketDetailBottomSheet({
    super.key,
    required this.rocketModel,
    required this.keys,
    required this.values,
  });

  final RocketModel rocketModel;
  final List<String> keys;
  final List<String> values;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorManger.blackColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RocketNameAndSetting(rocketModel: rocketModel),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: keys.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: RocketInfoDetails(
                      subtitle: keys[index],
                      title: values[index],
                    ),
                  );
                },
              ),
            ),
            verticalSpacing(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const DiscrptionWidgets(),
                  verticalSpacing(5),
                  Text(
                    rocketModel.description,
                    style: AppStyle.font15Greysemibold.copyWith(
                      color: ColorManger.greyColor.withOpacity(0.9),
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            verticalSpacing(20),
            CustomDetialsRow(
              title: 'Company',
              subtitle: rocketModel.company,
            ),
            CustomDetialsRow(
              title: 'Country',
              subtitle: rocketModel.country,
            ),
            CustomDetialsRow(
              title: 'First Flight',
              subtitle: rocketModel.firstflight,
            ),
            CustomDetialsRow(
              title: 'Name',
              subtitle: rocketModel.name,
            ),
          ],
        ),
      ),
    );
  }
}
