import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/theming/styles.dart';
import 'package:spacex/feature/dragons/data/models/DragonModel.dart';
import 'package:spacex/feature/dragons/ui/views/dragon_screen_details.dart';

import '../../feature/layout/logic/layout_cubit.dart';
import '../../feature/layout/ui/views/layout_screan.dart';
import '../di/service_locator.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => serviceLocator.get<LayoutCubit>(),
              child: const LayoutScreen(),
            );
          },
        );

      case Routes.dragonDetails:
        final args = routeSettings.arguments as DragonModel;
        return MaterialPageRoute(
          builder: (context) {
            return DragonDetailsScreen(dragonModel: args);
          },
        );

      default:
        return _unFoundRoute();
    }
  }

  static Route<dynamic> _unFoundRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        body: Center(
          child: Text(
            'Not Found this Route',
            style: AppStyle.font14Blacksemibold,
          ),
        ),
      ),
    );
  }
}
