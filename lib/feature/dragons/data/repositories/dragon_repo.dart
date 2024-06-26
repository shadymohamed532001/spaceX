import 'package:dartz/dartz.dart';
import 'package:spacex/feature/dragons/data/models/dragonModel.dart';

import '../../../../core/networking/failuer.dart';

abstract class DragonRepo {
  Future<Either<Failure, List<DragonModel>>> fetchDragons();
  Future<Either<Failure, List<DragonModel>>> saveDragonsToLocalDatabase(
      List<DragonModel> dragons);
  Future<Either<Failure, List<DragonModel>>> getDragonsFormLocalDatabase();
}
