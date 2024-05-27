import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/feature/crew/data/models/crew_models.dart';
import 'package:spacex/feature/crew/data/repositories/crew_repo.dart';

part 'crew_state.dart';

class CrewCubit extends Cubit<CrewState> {
  CrewCubit({required this.crewRepo}) : super(CrewInitial());
  final CrewRepo crewRepo;

  List<CrewModel> crewLocal = [];
  Future<void> saveCrewsDataToLocal(List<CrewModel> crew) async {
    emit(SaveCrewDataToLocalLoadingState());
    var response = await crewRepo.saveCrewToLocalDatabase(crew);
    response.fold((failure) {
      emit(SaveCrewDataToLocalErrorState(error: failure.errMessage));
    }, (crews) async {
      emit(
        SaveCrewDataToLocalSuccessState(crew: crew),
      );
    });
  }

  Future<List<CrewModel>> loadCrewssDataFromLocal() async {
    emit(LoadCrewDataToLocalLoadingState());
    var response = await crewRepo.getCrewFormLocalDatabase();
    return response.fold((failure) {
      emit(LoadCrewDataToLocalErorrState(error: failure.errMessage));
      return [];
    }, (crew) {
      emit(LoadCrewDataToLocalSuccessState(crew: crew));
      return crew;
    });
  }

  Future<void> getCrews() async {
    emit(GetCrewsLoading());
    try {
      final localCrewData = await loadCrewssDataFromLocal();

      if (localCrewData.isNotEmpty) {
        crewLocal = localCrewData;

        emit(GetCrewsSuccess(
          crew: localCrewData,
        ));
      } else {
        var response = await crewRepo.getCrew();

        response.fold((failure) {
          emit(GetCrewsError(
            error: failure.errMessage,
          ));
        }, (crew) async {
          crewLocal = crew;

          await saveCrewsDataToLocal(crew);
          emit(GetCrewsSuccess(crew: crew));
        });
      }
    } catch (e) {
      emit(GetCrewsError(error: e.toString()));
    }
  }
}
