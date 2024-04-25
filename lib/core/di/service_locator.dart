import 'package:get_it/get_it.dart';
import 'package:spacex/feature/dragons/data/repositories/dragon_repo_impl.dart';
import 'package:spacex/feature/dragons/logic/get_dragons_cubit/get_dragons_cubit.dart';
import 'package:spacex/feature/layout/data/repositories/layout_repo.dart';
import 'package:spacex/feature/layout/data/repositories/layout_repo_impl.dart';
import 'package:spacex/feature/layout/logic/layout_cubit.dart';

import '../../feature/dragons/data/repositories/dragon_repo.dart';
import '../networking/api_services.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  Future<void> setupServiceLocator() async {
    _setupForRepos();

    _setupForCubits();
  }

  void _setupForRepos() {
    serviceLocator.registerLazySingleton<LayOutRepo>(() => LayoutRepoImpl());
    serviceLocator.registerLazySingleton<ApiService>(() => ApiService());
    serviceLocator.registerLazySingleton<DragonRepo>(() => DragonRepoImpl());
  }

  void _setupForCubits() {
    serviceLocator.registerFactory<LayoutCubit>(
        () => LayoutCubit(layOutRepo: serviceLocator.get<LayOutRepo>()));

    serviceLocator.registerFactory<GetDragonsCubit>(
        () => GetDragonsCubit(dragonRepo: serviceLocator.get<DragonRepo>()));
  }
}
