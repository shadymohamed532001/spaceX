import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/theming/colors.dart';

import '../../data/models/DragonModel.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    super.key,
    required this.widget,
    required this.dragonModel,
  });

  final Widget widget;
  final DragonModel dragonModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.blackColor,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CachedNetworkImage(
                      imageUrl: dragonModel.name!.contains("1")
                          ? dragonModel.flickrImages![1]
                          : dragonModel.flickrImages![0],
                      width: double.infinity,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.sizeOf(context).height * 0.3),
                      child: Container(
                        width: double.infinity,
                        decoration: const ShapeDecoration(
                            color: ColorManger.blackColor,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.white38,
                                    strokeAlign: BorderSide.strokeAlignOutside),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30)))),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [widget],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
