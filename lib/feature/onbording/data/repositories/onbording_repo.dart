import 'package:flutter/material.dart';
import 'package:spacex/feature/onbording/data/models/on_bording_model.dart';

abstract class OnBoardingRepo {
  List<OnBordingModel> onBoardingPages();

  void navigateBetweenPages({
    required BuildContext context,
    required PageController pageController,
    required bool isLastBoarding,
  });

  void navigateToAuth({required BuildContext context});
}
