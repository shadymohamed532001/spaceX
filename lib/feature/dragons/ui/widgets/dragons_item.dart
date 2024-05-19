import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex/core/helpers/naviagtion_extentaions.dart';
import 'package:spacex/core/theming/styles.dart';

import '../../data/models/DragonModel.dart';

class DragonsItem extends StatelessWidget {
  const DragonsItem({super.key, this.dragons, required this.index});

  final DragonModel? dragons;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(routeName: '/dragonDetails', arguments: dragons);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 7.h),
        child: Container(
          height: 120.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: Colors.grey.shade900),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0.w),
                child: SizedBox(
                  height: 150.h,
                  width: 150.w,
                  child: Image(
                      image: NetworkImage(index == 0
                          ? dragons!.flickrImages![1]
                          : dragons!.flickrImages?[0] ?? "")),
                ),
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
