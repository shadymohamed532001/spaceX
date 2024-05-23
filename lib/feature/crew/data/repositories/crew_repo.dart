import 'package:dartz/dartz.dart';
import 'package:spacex/core/networking/failuer.dart';
import 'package:spacex/feature/crew/data/models/crew_models.dart';

abstract class CrewRepo{
   Future<Either<Failure, List<CrewModel>>> getCrew();
  Future<Either<Failure, List<CrewModel>>> saveCrewToLocalDatabase(
    List<CrewModel> crews,
  );
  Future<Either<Failure, List<CrewModel>>> getCrewFormLocalDatabase();
}