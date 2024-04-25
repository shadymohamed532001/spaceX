import 'package:flutter/material.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/image_assets.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({
    super.key,
    required this.widget,
  });

  final Widget widget;
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
                    const Image(
                      image: AssetImage(Assets.dragonTest),
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

//Padding(
//                 padding: const EdgeInsets.only(top: 80),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Stack(
//                       children: [
//                         Container(
//                           width: double.infinity,
//                           decoration: const ShapeDecoration(
//                               color: AppColor.white,
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(30),
//                                       topRight: Radius.circular(30)))),
//                           child: const Stack(
//                             clipBehavior: Clip.none,
//                             children: [
//                               DoctorAboutHeader(),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                     left: 30.0, right: 30, top: 73),
//                                 child: SingleChildScrollView(
//                                   physics: BouncingScrollPhysics(),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       AboutDoctorSection(),
//                                       ComplaintDoctorSection(),
//                                       RateOverallSection(),
//                                       PatientReviewsSection()
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               )
