import 'package:dartz/dartz.dart';
import 'package:spacex/core/networking/failuer.dart';
import 'package:spacex/feature/rockets/data/model/reocket_model.dart';

abstract class RocketRepo {
  Future<Either<Failure, List<RocketModel>>> getRockets();
}
