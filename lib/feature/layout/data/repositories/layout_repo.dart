import 'package:flutter/material.dart';
import 'package:spacex/feature/layout/data/models/change_index_params.dart';

abstract class LayOutRepo {
  void changeBottomNavIndex({required ChangeIndexParams changeIndexParams});

  void changeBottomNavToHome({required ChangeIndexParams changeIndexParams});

  List<Widget> getBody();

  List<BottomNavigationBarItem> getBottomNavItems();
}
