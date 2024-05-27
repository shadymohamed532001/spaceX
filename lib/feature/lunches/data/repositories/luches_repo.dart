import 'package:dartz/dartz.dart';
import 'package:spacex/core/networking/failuer.dart';
import 'package:spacex/feature/lunches/data/model/launch_model.dart';

abstract class LuchesRepo {
  Future<Either<Failure, List<LaunchModel>>> getLunches();
  Future<Either<Failure, List<LaunchModel>>> saveLuchesToLocalDatabase(
    List<LaunchModel> rockets,
  );
  Future<Either<Failure, List<LaunchModel>>> getLunchesFormLocalDatabase();
}
