part of 'rockets_cubit.dart';

sealed class RocketsState extends Equatable {
  const RocketsState();

  @override
  List<Object> get props => [];
}

final class RocketsInitial extends RocketsState {}

final class RocketsLoading extends RocketsState {}

final class RocketsSuccess extends RocketsState {
  final List<RocketModel> rockets;
  const RocketsSuccess({required this.rockets});
}

final class RocketsError extends RocketsState {
  final String error;

  const RocketsError({required this.error});
}
