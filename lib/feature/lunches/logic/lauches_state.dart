part of 'lauches_cubit.dart';

sealed class LauchesState extends Equatable {
  const LauchesState();

  @override
  List<Object> get props => [];
}

final class LauchesInitial extends LauchesState {}

final class GetLauchessLoading extends LauchesState {}

final class GetLauchessSuccess extends LauchesState {
  final List<dynamic> lauches;
  const GetLauchessSuccess({required this.lauches});
}

final class GetLauchessError extends LauchesState {
  final String error;

  const GetLauchessError({required this.error});
}

final class GetLauchessSuccessFromLocal extends LauchesState {
  final List<LaunchModel> lauchess;
  const GetLauchessSuccessFromLocal({required this.lauchess});
}

final class SaveLauchesDataToLocalLoadingState extends LauchesState {}

final class SaveLauchesDataToLocalErrorState extends LauchesState {
  final String error;
  const SaveLauchesDataToLocalErrorState({required this.error});
}

final class SaveLauchesDataToLocalSuccessState extends LauchesState {
  final List<LaunchModel> lauchess;
  const SaveLauchesDataToLocalSuccessState({required this.lauchess});
}


final class LoadLauchesDataToLocalLoadingState extends LauchesState {}

final class LoadLauchesDataToLocalErorrState extends LauchesState {
  final String error;
  const LoadLauchesDataToLocalErorrState({required this.error});
}

final class LoadLauchesDataToLocalSuccessState extends LauchesState {
  final List<LaunchModel> lauchess;
  const LoadLauchesDataToLocalSuccessState({required this.lauchess});
}