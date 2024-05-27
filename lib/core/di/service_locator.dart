import 'package:get_it/get_it.dart';
import 'package:spacex/feature/crew/data/repositories/crew_repo.dart';
import 'package:spacex/feature/crew/data/repositories/crew_repo_impl.dart';
import 'package:spacex/feature/crew/logic/crew_cubit.dart';
import 'package:spacex/feature/dragons/data/repositories/dragon_repo.dart';
import 'package:spacex/feature/dragons/data/repositories/dragon_repo_impl.dart';
import 'package:spacex/feature/dragons/logic/get_dragons_cubit/get_dragons_cubit.dart';
import 'package:spacex/feature/layout/data/repositories/layout_repo.dart';
import 'package:spacex/feature/layout/data/repositories/layout_repo_impl.dart';
import 'package:spacex/feature/layout/logic/layout_cubit.dart';
import 'package:spacex/feature/lunches/data/repositories/luches_repo.dart';
import 'package:spacex/feature/lunches/data/repositories/luches_repo_impl.dart';
import 'package:spacex/feature/lunches/logic/lauches_cubit.dart';
import 'package:spacex/feature/onbording/data/repositories/onbording_repo.dart';
import 'package:spacex/feature/onbording/data/repositories/onbording_repo_impl.dart';
import 'package:spacex/feature/onbording/logic/cubit/onbording_cubit.dart';
import 'package:spacex/feature/rockets/data/repositories/rockets_repo.dart';
import 'package:spacex/feature/rockets/data/repositories/rockets_repo_impl.dart';
import 'package:spacex/feature/rockets/logic/cubit/rockets_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  Future<void> setupServiceLocator() async {
    _setupForRepos();

    _setupForCubits();
  }

  void _setupForRepos() {
    serviceLocator.registerLazySingleton<LayOutRepo>(() => LayoutRepoImpl());

    serviceLocator.registerLazySingleton<RocketRepo>(() => RocketRepoImpl());

    serviceLocator.registerLazySingleton<DragonRepo>(() => DragonRepoImpl());

    serviceLocator.registerLazySingleton<LuchesRepo>(() => LuchesRepoImpl());

    serviceLocator.registerLazySingleton<CrewRepo>(() => CrewRepoImpl());

    serviceLocator
        .registerLazySingleton<OnBoardingRepo>(() => OnBoardingRepoImpl());
  }

  void _setupForCubits() {
    serviceLocator.registerFactory<LayoutCubit>(
        () => LayoutCubit(layOutRepo: serviceLocator.get<LayOutRepo>()));
    serviceLocator.registerFactory<OnbordingCubit>(() =>
        OnbordingCubit(onBoardingRepo: serviceLocator.get<OnBoardingRepo>()));

    serviceLocator.registerFactory<RocketsCubit>(
        () => RocketsCubit(rocketRepo: serviceLocator.get<RocketRepo>()));

    serviceLocator.registerFactory<GetDragonsCubit>(
        () => GetDragonsCubit(dragonRepo: serviceLocator.get<DragonRepo>()));

    serviceLocator.registerFactory<LauchesCubit>(
        () => LauchesCubit(luchesRepo: serviceLocator.get<LuchesRepo>()));

    serviceLocator.registerFactory<CrewCubit>(
        () => CrewCubit(crewRepo: serviceLocator.get<CrewRepo>()));
  }
}
