

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/feature/dragons/logic/get_dragons_cubit/get_dragons_cubit.dart';
import 'package:spacex/feature/layout/data/models/change_index_params.dart';
import 'package:spacex/feature/layout/data/repositories/layout_repo.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit({required this.layOutRepo}) : super(LayoutInitial());

  final LayOutRepo layOutRepo;

  static LayoutCubit getObject(context) =>
      BlocProvider.of<LayoutCubit>(context);

  int currentIndex = 2;

  List<Widget> getBody() {
    return layOutRepo.getBody();
  }

  List<BottomNavigationBarItem> getBottomNavItems() =>
      layOutRepo.getBottomNavItems();

  void changeBottomNavIndex(int index, BuildContext context) {
    currentIndex = index;

    layOutRepo.changeBottomNavIndex(
      changeIndexParams: ChangeIndexParams(
        context: context,
        index: index,
      ),
    );

    if (currentIndex == 0) {}

    if (currentIndex == 1) {
  
    }
    if (currentIndex == 2) {
            BlocProvider.of<GetDragonsCubit>(context).getAllDragons();

    }
    emit(ChangeBottomNavState(index: index));
  }

  void changeBottomNavToHome(BuildContext context) {
    layOutRepo.changeBottomNavToHome(
        changeIndexParams: ChangeIndexParams(context: context));

    emit(const ChangeBottomNavToHome());
  }
}