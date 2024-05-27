import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/bloc_observer.dart.dart';
import 'package:spacex/core/di/service_locator.dart';
import 'package:spacex/core/helpers/helper_const.dart';
import 'package:spacex/core/helpers/local_services.dart';
import 'package:spacex/core/networking/api_services.dart';
import 'package:spacex/spacex_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().setupServiceLocator();
  Bloc.observer = MyBlocObserver();
  await LocalServices.init();
  ApiServices.init();
  fetchDataFromLocalStorage();
  runApp(const SpceXApp());
}
