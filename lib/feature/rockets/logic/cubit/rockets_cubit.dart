import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/feature/rockets/data/model/reocket_model.dart';
import 'package:spacex/feature/rockets/data/repositories/rockets_repo.dart';

part 'rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  RocketsCubit({required this.rocketRepo}) : super(RocketsInitial());
  final RocketRepo rocketRepo;
  void getRockets() async {
    emit(RocketsLoading());
    final getRocketsEither = await rocketRepo.getRockets();
    getRocketsEither.fold(
      (failure) {
        emit(
          RocketsError(error: failure.errMessage),
        );
      },
      (rockets) {
        print(rockets[0].firstStage.engines);
        print(rockets[0].diameter.meters);
        print(rockets[0].secondStage.burnTimeSec);
        print(rockets[0].height.meters);
        print(rockets[0].diameter.feet);
        emit(RocketsSuccess(rockets: rockets));
      },
    );
  }
}
