import 'package:spacex/core/helpers/local_services.dart';

bool? onBoardingMoveStep;
Future<Map<String, dynamic>> fetchDataFromLocalStorage() async {
  onBoardingMoveStep = LocalServices.getData(key: 'onbording');
  return {
    'onBording': onBoardingMoveStep,
  };
}
