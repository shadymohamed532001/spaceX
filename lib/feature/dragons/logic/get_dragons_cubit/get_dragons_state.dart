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
