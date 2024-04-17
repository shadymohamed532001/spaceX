import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/feature/layout/logic/layout_cubit.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        LayoutCubit cubit = LayoutCubit.getObject(context);

        return BottomNavigationBar(
          currentIndex: cubit.currentIndex,
          onTap: (index) => cubit.changeBottomNavIndex(index, context),
          items: cubit.getBottomNavItems(),
          selectedItemColor: ColorManger.blackColor,
          unselectedItemColor: ColorManger.greyColor,
          backgroundColor: ColorManger.whiteColor,
          elevation: 0,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        );
      },
    );
  }
}
