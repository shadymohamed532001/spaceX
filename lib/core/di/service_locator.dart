import 'package:get_it/get_it.dart';
import 'package:spacex/feature/layout/data/repositories/layout_repo.dart';
import 'package:spacex/feature/layout/data/repositories/layout_repo_impl.dart';
import 'package:spacex/feature/layout/logic/layout_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  Future<void> setupServiceLocator() async {
    _setupForRepos();

    _setupForCubits();
  }

  void _setupForRepos() {
    serviceLocator.registerLazySingleton<LayOutRepo>(() => LayoutRepoImpl());
  }

  void _setupForCubits() {
    serviceLocator.registerFactory<LayoutCubit>(
        () => LayoutCubit(layOutRepo: serviceLocator.get<LayOutRepo>()));
  }
}
