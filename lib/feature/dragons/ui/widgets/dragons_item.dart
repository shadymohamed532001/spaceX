import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex/core/helpers/naviagtion_extentaions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/styles.dart';

import '../../data/models/dragonModel.dart';

class DragonsItem extends StatelessWidget {
  const DragonsItem({super.key, this.dragons, required this.index});

  final DragonModel? dragons;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(
            routeName: Routes.dragonScreenDetailsRoute, arguments: dragons);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 7.h),
        child: Container(
          height: 120.h,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            color: ColorManger.greyColor.withOpacity(0.2),
          ),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(
                  8.0.w,
                ),
                child: SizedBox(
                    height: 150.h,
                    width: 150.w,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.r),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: index == 0
                            ? dragons!.flickrImages![1]
                            : dragons!.flickrImages?[0] ?? "",
                      ),
                    )),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        " Name : ${dragons!.name ?? ""}",
                        style: AppStyle.font10WhiteRegular,
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        "Crew capacity : ${dragons!.crewCapacity} ",
                        style: AppStyle.font10WhiteRegular,
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        "Thrusters type : ${dragons!.thrusters?[index].type ?? ""} ",
                        style: AppStyle.font10WhiteRegular,
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        "Material : ${dragons!.heatShield?.material ?? ""} ",
                        style: AppStyle.font10WhiteRegular,
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
