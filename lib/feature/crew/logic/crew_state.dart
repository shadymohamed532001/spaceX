part of 'crew_cubit.dart';

sealed class CrewState extends Equatable {
  const CrewState();

  @override
  List<Object> get props => [];
}

final class CrewInitial extends CrewState {}

final class GetCrewsLoading extends CrewState {}

final class GetCrewsSuccess extends CrewState {
  final List<dynamic> crew;
  const GetCrewsSuccess({required this.crew});
}

final class GetCrewsError extends CrewState {
  final String error;

  const GetCrewsError({required this.error});
}

final class GetCrewsSuccessFromLocal extends CrewState {
  final List<CrewModel> crews;
  const GetCrewsSuccessFromLocal({required this.crews});
}

final class SaveCrewDataToLocalLoadingState extends CrewState {}

final class SaveCrewDataToLocalErrorState extends CrewState {
  final String error;
  const SaveCrewDataToLocalErrorState({required this.error});
}

final class SaveCrewDataToLocalSuccessState extends CrewState {
  final List<CrewModel> crew;
  const SaveCrewDataToLocalSuccessState({required this.crew});
}

final class LoadCrewDataToLocalLoadingState extends CrewState {}

final class LoadCrewDataToLocalErorrState extends CrewState {
  final String error;
  const LoadCrewDataToLocalErorrState({required this.error});
}

final class LoadCrewDataToLocalSuccessState extends CrewState {
  final List<CrewModel> crew;
  const LoadCrewDataToLocalSuccessState({required this.crew});
}
