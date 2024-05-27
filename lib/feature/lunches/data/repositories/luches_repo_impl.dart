import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spacex/core/helpers/local_services.dart';
import 'package:spacex/core/networking/api_services.dart';
import 'package:spacex/core/networking/end_boint.dart';
import 'package:spacex/core/networking/failuer.dart';
import 'package:spacex/core/networking/servier_failure.dart';
import 'package:spacex/feature/lunches/data/model/launch_model.dart';
import 'package:spacex/feature/lunches/data/repositories/luches_repo.dart';

class LuchesRepoImpl implements LuchesRepo {
  @override
  Future<Either<Failure, List<LaunchModel>>> getLunches() async {
    try {
      List<dynamic> response =
          await ApiServices.getData(endpoint: getAllLaunchesEndPoint);

      List<LaunchModel> rockets =
          response.map((json) => LaunchModel.fromJson(json)).toList();

      return Right(rockets);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<LaunchModel>>> saveLuchesToLocalDatabase(
      List<LaunchModel> lauches) async {
    try {
      await LocalServices.saveModelToLocalDatabase('luanches', lauches);
      return Right(lauches);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<LaunchModel>>>
      getLunchesFormLocalDatabase() async {
    try {
      List<LaunchModel> dragons =
          await LocalServices.getModelFromLocalDatabase<LaunchModel>(
              'luanches', (data) => LaunchModel.fromJson(data));
      return Right(dragons);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
