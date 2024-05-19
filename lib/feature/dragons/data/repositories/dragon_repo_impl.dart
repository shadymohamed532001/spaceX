import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:spacex/core/helpers/local_services.dart';
import 'package:spacex/core/networking/end_boint.dart';
import 'package:spacex/core/networking/failuer.dart';
import 'package:spacex/feature/dragons/data/models/DragonModel.dart';

import '../../../../core/networking/api_services.dart';
import '../../../../core/networking/servier_failure.dart';
import 'dragon_repo.dart';

class DragonRepoImpl extends DragonRepo {
  DragonRepoImpl();
  @override
  Future<Either<Failure, List<DragonModel>>> fetchDragons() async {
    try {
      final data = await ApiServices.getData(endpoint: getAllDragonsEndPoints);

      List<DragonModel> dragons = [];

      for (var item in data) {
        dragons.add(DragonModel.fromJson(item));
      }
      return right(dragons);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(
        ServerFailure(e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<DragonModel>>> saveDragonsToLocalDatabase(
      List<DragonModel> dragons) async {
    try {
      await LocalServices.saveModelToLocalDatabase('dragons', dragons);
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
  Future<Either<Failure, List<DragonModel>>>
      getDragonsFormLocalDatabase() async {
    try {
      List<DragonModel> dragons =
          await LocalServices.getModelFromLocalDatabase<DragonModel>(
              'dragons', (data) => DragonModel.fromJson(data));
      return Right(dragons);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
