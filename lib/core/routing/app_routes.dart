import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/di/service_locator.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/theming/styles.dart';
import 'package:spacex/feature/dragons/data/models/dragonModel.dart';
import 'package:spacex/feature/dragons/ui/views/dragon_screen_details.dart';
import 'package:spacex/feature/layout/logic/layout_cubit.dart';
import 'package:spacex/feature/layout/ui/views/layout_screan.dart';
import 'package:spacex/feature/lunches/data/model/launch_model.dart';
import 'package:spacex/feature/lunches/ui/views/luches_screen_details.dart';
import 'package:spacex/feature/rockets/data/model/reocket_model.dart';
import 'package:spacex/feature/rockets/ui/views/reocket_screan_details.dart';

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

      case Routes.rocketScreenDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => RocketScreenDetails(
            rocketModel: routeSettings.arguments as RocketModel,
          ),
        );

      case Routes.dragonScreenDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => DragonDetailsScreen(
            dragonModel: routeSettings.arguments as DragonModel,
          ),
        );
      case Routes.launcheScreenDetailsRoute:
        return MaterialPageRoute(
          builder: (context) => LunchesScreenDetails(
            lauchesModel: routeSettings.arguments as LaunchModel,
          ),
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
