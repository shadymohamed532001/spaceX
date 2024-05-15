import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/image_assets.dart';
import 'package:spacex/feature/dragons/ui/views/dragons_screen.dart';
import 'package:spacex/feature/layout/data/models/change_index_params.dart';
import 'package:spacex/feature/layout/data/repositories/layout_repo.dart';
import 'package:spacex/feature/layout/logic/layout_cubit.dart';
import 'package:spacex/feature/lunches/ui/views/lunches_screen.dart';
import 'package:spacex/feature/rockets/ui/views/rockets_screen.dart';

class LayoutRepoImpl extends LayOutRepo {
  @override
  void changeBottomNavIndex({required ChangeIndexParams changeIndexParams}) {
    LayoutCubit.getObject(changeIndexParams.context).currentIndex =
        changeIndexParams.index!;
  }

  @override
  void changeBottomNavToHome({required ChangeIndexParams changeIndexParams}) {
    LayoutCubit.getObject(changeIndexParams.context).currentIndex = 2;
  }

  @override
  List<Widget> getBody() {
    return const <Widget>[
      LunchesScreen(),
      RocketScreen(),
      DragonsScreen(),
    ];
  }

  @override
  List<BottomNavigationBarItem> getBottomNavItems() {
    return <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.rocket_launch,
          color: ColorManger.whiteColor,
        ),
        label: 'Lunches',
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.rocket,
          color: ColorManger.whiteColor,
        ),
        label: 'Rockets',
      ),
      BottomNavigationBarItem(
        label: 'Dragons',
        icon: SizedBox(
          height: 22,
          child: SvgPicture.asset(
            ImagesAssetsManager.dragonIcon,
            colorFilter:
                const ColorFilter.mode(ColorManger.whiteColor, BlendMode.srcIn),
          ),
        ),
      ),
    ];
  }
}
