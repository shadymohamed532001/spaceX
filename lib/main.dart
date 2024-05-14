import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/di/service_locator.dart';
import 'package:spacex/core/networking/api_services.dart';
import 'package:spacex/spacex_app.dart';

import 'core/helpers/bloc_observer.dart';
import 'core/helpers/local_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceLocator().setupServiceLocator();
  await LocalServices.init();
  ApiServices.init();
  Bloc.observer = MyBlocObserver();
  runApp(const SpceXApp());
}
