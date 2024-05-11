part of 'rockets_cubit.dart';

sealed class RocketsState extends Equatable {
  const RocketsState();

  @override
  List<Object> get props => [];
}

final class RocketsInitial extends RocketsState {}

final class GetRocketsLoading extends RocketsState {}

final class GetRocketsSuccess extends RocketsState {
  final List<dynamic> rockets;
  const GetRocketsSuccess({required this.rockets});
}

final class GetRocketsError extends RocketsState {
  final String error;

  const GetRocketsError({required this.error});
}


final class GetRocketsSuccessFromLocal extends RocketsState {
  final List<RocketModel> rockets;
  const GetRocketsSuccessFromLocal({required this.rockets});
}

