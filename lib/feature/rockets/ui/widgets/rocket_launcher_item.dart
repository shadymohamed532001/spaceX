import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex/core/helpers/spacing.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/image_assets.dart';
import 'package:spacex/core/theming/styles.dart';
import 'package:spacex/feature/rockets/data/model/reocket_model.dart';

class RocketLauncherItem extends StatelessWidget {
  const RocketLauncherItem({
    super.key,
    required this.rocketModel,
  });
  final RocketModel rocketModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 15.h),
        height: 90.h,
        decoration: BoxDecoration(
          color: ColorManger.greyColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(28),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 18.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rocketModel.name,
                    style: AppStyle.font18Whitesemibold,
                  ),
                  verticalSpacing(2),
                  Text(
                    rocketModel.firstflight,
                    style: AppStyle.font15Greysemibold,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(right: 16.w),
                child: Image.asset(
                  rocketModel.active
                      ? ImagesAssetsManager.rocketLauncher
                      : ImagesAssetsManager.rocketNotLauncher,
                  width: 30.w,
                  height: 35.h,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
