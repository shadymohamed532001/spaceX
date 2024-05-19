import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spacex/core/helpers/local_services.dart';
import 'package:spacex/core/networking/api_services.dart';
import 'package:spacex/core/networking/end_boint.dart';
import 'package:spacex/core/networking/failuer.dart';
import 'package:spacex/core/networking/servier_failure.dart';
import 'package:spacex/feature/rockets/data/model/reocket_model.dart';
import 'package:spacex/feature/rockets/data/repositories/rockets_repo.dart';

class RocketRepoImpl implements RocketRepo {
  RocketRepoImpl();

  @override
  Future<Either<Failure, List<RocketModel>>> getRockets() async {
    try {
      List<dynamic> response =
          await ApiServices.getData(endpoint: getAllRocketsendpoint);

      List<RocketModel> rockets =
          response.map((json) => RocketModel.fromJson(json)).toList();

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
  Future<Either<Failure, List<RocketModel>>> saveRocketsToLocalDatabase(
      List<RocketModel> dragons) async {
    try {
      await LocalServices.saveModelToLocalDatabase('rockets', dragons);
      return Right(dragons);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<RocketModel>>>
      getRocketsFormLocalDatabase() async {
    try {
      List<RocketModel> dragons =
          await LocalServices.getModelFromLocalDatabase<RocketModel>(
              'rockets', (data) => RocketModel.fromJson(data));
      return Right(dragons);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
