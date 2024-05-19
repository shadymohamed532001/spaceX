part of 'get_dragons_cubit.dart';

abstract class GetDragonsState {}

class GetDragonsInitial extends GetDragonsState {}

class GetDragonsLoadingState extends GetDragonsState {}

class GetDragonsSuccessState extends GetDragonsState {
  final List<DragonModel> dragons;
  GetDragonsSuccessState(this.dragons);
}

class GetDragonsErrorState extends GetDragonsState {
  final String error;
  GetDragonsErrorState(this.error);
}

class GetDragonsSuccessFromLocal extends GetDragonsState {
  final List<DragonModel> dragons;

  GetDragonsSuccessFromLocal({required this.dragons});
}

class SaveDragonDataToLocalLoadingState extends GetDragonsState {}

class SaveDragonDataToLocalSuccessState extends GetDragonsState {
  final List<DragonModel> dragons;

  SaveDragonDataToLocalSuccessState({required this.dragons});
}

class SaveDragonDataToLocalErrorState extends GetDragonsState {
  final String error;

  SaveDragonDataToLocalErrorState({required this.error});
}

class LoadDragonDataToLocalLoadingState extends GetDragonsState {}

class LoadDragonDataToLocalSuccessState extends GetDragonsState {
  final List<DragonModel> dragons;

  LoadDragonDataToLocalSuccessState({required this.dragons});
}

class LoadDragonDataToLocalErrorState extends GetDragonsState {
  final String error;

  LoadDragonDataToLocalErrorState({required this.error});
}
