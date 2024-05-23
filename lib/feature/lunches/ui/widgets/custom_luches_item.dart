import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/helpers/naviagtion_extentaions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/styles.dart';

class CustomLuchesItem extends StatelessWidget {
  const CustomLuchesItem({super.key});

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
              imageUrl: 'https://images2.imgbox.com/73/7f/u7BKqv2C_o.png',
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
                        Text(
                          'DemoSat',
                          style: AppStyle.font18Whitesemibold,
                        ),
                        const Spacer(),
                        Image.asset(
                          'assets/images/iconscheck.png',
                          height: 25,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '2007-03-21T13:10:00+12:00',
                      style: AppStyle.font13Greysemibold,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      'Successful first stage burn and transition to second stage, maximum altitude 289 km, Premature engine shutdown at T+7 min 30 s, Failed to reach orbit, Failed to recover first stage',
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
