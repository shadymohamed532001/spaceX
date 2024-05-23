import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/helpers/naviagtion_extentaions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/image_assets.dart';
import 'package:spacex/core/theming/styles.dart';
import 'package:spacex/feature/lunches/data/model/launch_model.dart';

class CustomLuchesItem extends StatelessWidget {
  const CustomLuchesItem({super.key, required this.lauches});
  final LaunchModel lauches;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.navigateTo(routeName: Routes.launcheScreenDetailsRoute);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorManger.greyColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(36),
        ),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: lauches.links!.patch!.small!,
              height: 130,
              width: 130,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            lauches.name!,
                            style: AppStyle.font14Whitesemibold,
                            maxLines: 2,
                          ),
                        ),
                        const Spacer(),
                        lauches.success == true
                            ? Image.asset(
                                ImagesAssetsManager.check,
                                height: 25,
                              )
                            : Image.asset(
                                ImagesAssetsManager.cancel,
                                height: 25,
                              ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      lauches.dateUtc.toString(),
                      style: AppStyle.font13Greysemibold,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      lauches.details!,
                      maxLines: 2,
                      style: AppStyle.font13Greysemibold,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
