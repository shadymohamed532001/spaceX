import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex/core/di/service_locator.dart';
import 'package:spacex/core/routing/app_routes.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/feature/rockets/logic/cubit/rockets_cubit.dart';

import 'feature/dragons/logic/get_dragons_cubit/get_dragons_cubit.dart';

class SpceXApp extends StatelessWidget {
  const SpceXApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RocketsCubit>(
          create: (BuildContext context) => serviceLocator.get<RocketsCubit>(),
        ),
        BlocProvider(
            create: (BuildContext context) =>
                serviceLocator.get<GetDragonsCubit>()..getAllDragons())
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoute,
          theme: ThemeData(
            scaffoldBackgroundColor: ColorManger.blackColor,
            iconTheme: const IconThemeData(color: ColorManger.whiteColor),
          ),
        ),
      ),
    );
  }
}
