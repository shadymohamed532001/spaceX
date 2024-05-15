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
  Future<Either<Failure, bool>> saveRocketsToLocalDatabase(
      List<RocketModel> rockets) async {
    try {
      final rocketListJson = rockets.map((rocket) => rocket.toJson()).toList();
      await LocalServices.saveData(key: 'rockets', value: rocketListJson);
      return const Right(true);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  // @override
  // Future<Either<Failure, List<RocketModel>>>
  //     getRocketsFormLocalDatabase() async {
  //   try {
  //     // List<RocketModel> rockets = await LocalServices.getModel(
  //     //   key: 'Rockets',
  //     // );
  //     // return Right(rockets);
  //   } catch (e) {
  //     if (e is DioException) {
  //       return left(ServerFailure.fromDioException(e));
  //     } else {
  //       return left(ServerFailure(e.toString()));
  //     }
  //   }
  // }
}
