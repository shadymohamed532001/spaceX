import 'package:dartz/dartz.dart';
import 'package:spacex/feature/dragons/data/models/DragonModel.dart';

import '../../../../core/networking/failuer.dart';

abstract class DragonRepo {
  Future<Either<Failure, List<DragonModel>>> fetchDragons();
}
