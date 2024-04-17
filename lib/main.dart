import 'package:flutter/material.dart';
import 'package:spacex/core/di/service_locator.dart';
import 'package:spacex/spacex_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().setupServiceLocator();
  runApp(const SpceXApp());
}
