// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/feature/layout/logic/layout_cubit.dart';

class LayoutScreenBody extends StatelessWidget {
  const LayoutScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.getObject(context);

        return WillPopScope(
          onWillPop: () {
            if (cubit.currentIndex != 0) {
              cubit.changeBottomNavToHome(context);
              return Future.value(false);
            }
            return Future.value(true);
          },
          child: cubit.getBody()[cubit.currentIndex],
        );
      },
    );
  }
}