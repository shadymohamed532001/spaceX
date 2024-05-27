import 'package:flutter/material.dart';
import 'package:spacex/core/helpers/local_services.dart';
import 'package:spacex/core/helpers/naviagtion_extentaions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/theming/image_assets.dart';
import 'package:spacex/feature/onbording/data/models/on_bording_model.dart';
import 'package:spacex/feature/onbording/data/repositories/onbording_repo.dart';

class OnBoardingRepoImpl implements OnBoardingRepo {
  @override
  void navigateToAuth({required BuildContext context}) {
    LocalServices.saveData(
      key: 'onbording',
      value: true,
    ).then((value) {
      context.navigateAndRemoveUntil(
        newRoute: Routes.layOutViewsRoute,
      );
    });
  }

  @override
  List<OnBordingModel> onBoardingPages() {
    return <OnBordingModel>[
      OnBordingModel(
          tittle: 'Welcome to Spacex',
          imagepath: ImagesAssetsManager.moon,
          subtittle:
              'SpaceX revolutionizes space travel with reusable Falcon and Starship rockets. Regular launches carry satellites, cargo, and crew, reducing costs. Join the journey to Mars and beyond with SpaceX'),
      OnBordingModel(
        tittle: 'Reliable information',
        imagepath: ImagesAssetsManager.rocket,
        subtittle:
            'The SpaceX app offers comprehensive details about the company\'s missions, rockets, and spacecraft',
      ),
    ];
  }

  @override
  void navigateBetweenPages(
      {required BuildContext context,
      required PageController pageController,
      required bool isLastBoarding}) {
    if (isLastBoarding) {
      navigateToAuth(context: context);
    } else {
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.fastEaseInToSlowEaseOut,
      );
    }
  }
}
