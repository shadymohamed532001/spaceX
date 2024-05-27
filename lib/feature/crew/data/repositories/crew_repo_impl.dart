import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spacex/core/helpers/local_services.dart';
import 'package:spacex/core/networking/api_services.dart';
import 'package:spacex/core/networking/end_boint.dart';
import 'package:spacex/core/networking/failuer.dart';
import 'package:spacex/core/networking/servier_failure.dart';
import 'package:spacex/feature/crew/data/models/crew_models.dart';
import 'package:spacex/feature/crew/data/repositories/crew_repo.dart';

class CrewRepoImpl implements CrewRepo {
  @override
  Future<Either<Failure, List<CrewModel>>> getCrew() async {
    try {
      List<dynamic> response =
          await ApiServices.getData(endpoint: getAllCrewEndPoint);

      List<CrewModel> crews =
          response.map((json) => CrewModel.fromJson(json)).toList();

      return Right(crews);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<CrewModel>>> getCrewFormLocalDatabase() async {
    try {
      List<CrewModel> crews =
          await LocalServices.getModelFromLocalDatabase<CrewModel>(
              'Crews', (data) => CrewModel.fromJson(data));
      return Right(crews);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CrewModel>>> saveCrewToLocalDatabase(
      List<CrewModel> crews) async {
    try {
      await LocalServices.saveModelToLocalDatabase('Crews', crews);
      return Right(crews);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
