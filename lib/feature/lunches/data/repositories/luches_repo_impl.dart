import 'package:dartz/dartz.dart';
import 'package:spacex/core/networking/failuer.dart';
import 'package:spacex/feature/lunches/data/model/launch_model.dart';
import 'package:spacex/feature/lunches/data/repositories/luches_repo.dart';

class LuchesRepoImpl implements LuchesRepo {
  @override
  Future<Either<Failure, List<LaunchModel>>> getLunches() {
    // TODO: implement getLunches
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<LaunchModel>>> getLunchesFormLocalDatabase() {
    // TODO: implement getLunchesFormLocalDatabase
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<LaunchModel>>> saveLuchesToLocalDatabase(
      List<LaunchModel> rockets) {
    // TODO: implement saveLuchesToLocalDatabase
    throw UnimplementedError();
  }
}
