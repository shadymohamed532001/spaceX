import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spacex/feature/crew/ui/views/crew_screen.dart';
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
      CrewScreen()
    ];
  }

  @override
  List<BottomNavigationBarItem> getBottomNavItems() {
    return <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.rocket_launch,
        ),
        label: 'Lunches',
      ),
      const BottomNavigationBarItem(
        icon: Icon(
          Icons.rocket,
        ),
        label: 'Rockets',
      ),
      BottomNavigationBarItem(
        label: 'Dragons',
        icon: SvgPicture.asset(
          'assets/images/dragon_icon.svg',
          height: 22,
        ),
      ),
      const BottomNavigationBarItem(
        label: 'Crew',
        icon: Icon(
          Iconsax.people,
        ),
      ),
    ];
  }
}
