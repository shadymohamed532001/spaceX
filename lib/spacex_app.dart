import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex/core/routing/app_routes.dart';
import 'package:spacex/core/theming/colors.dart';

class SpceXApp extends StatelessWidget {
  const SpceXApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
    );
  }
}
