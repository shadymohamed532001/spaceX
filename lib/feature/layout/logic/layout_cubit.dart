import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/feature/layout/data/models/change_index_params.dart';
import 'package:spacex/feature/layout/data/repositories/layout_repo.dart';
import 'package:spacex/feature/rockets/logic/cubit/rockets_cubit.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit({required this.layOutRepo}) : super(LayoutInitial());

  final LayOutRepo layOutRepo;

  static LayoutCubit getObject(context) =>
      BlocProvider.of<LayoutCubit>(context);

  int currentIndex = 1;

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
      BlocProvider.of<RocketsCubit>(context).getRockets();
    }
    if (currentIndex == 3) {}
    if (currentIndex == 4) {}
    emit(ChangeBottomNavState(index: index));
  }

  void changeBottomNavToHome(BuildContext context) {
    layOutRepo.changeBottomNavToHome(
        changeIndexParams: ChangeIndexParams(context: context));

    emit(const ChangeBottomNavToHome());
  }
}
