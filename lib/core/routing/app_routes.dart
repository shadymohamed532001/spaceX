import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/di/service_locator.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/core/theming/styles.dart';
import 'package:spacex/feature/layout/logic/layout_cubit.dart';
import 'package:spacex/feature/layout/ui/views/layout_screan.dart';
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
          builder: (context) =>  RocketScreenDetails(
             rocketModel: routeSettings.arguments as RocketModel,
                    

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
