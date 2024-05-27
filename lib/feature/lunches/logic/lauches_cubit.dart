import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/feature/lunches/data/model/launch_model.dart';
import 'package:spacex/feature/lunches/data/repositories/luches_repo.dart';

part 'lauches_state.dart';

class LauchesCubit extends Cubit<LauchesState> {
  LauchesCubit({required this.luchesRepo}) : super(LauchesInitial());
  final LuchesRepo luchesRepo;

  List<LaunchModel> lauchesLocal = [];
  Future<void> saveLauchessDataToLocal(List<LaunchModel> lauches) async {
    emit(SaveLauchesDataToLocalLoadingState());
    var response = await luchesRepo.saveLuchesToLocalDatabase(lauches);
    response.fold((failure) {
      emit(SaveLauchesDataToLocalErrorState(error: failure.errMessage));
    }, (lauchess) async {
      emit(
        SaveLauchesDataToLocalSuccessState(lauchess: lauchess),
      );
    });
  }

  Future<List<LaunchModel>> loadLauchesssDataFromLocal() async {
    emit(LoadLauchesDataToLocalLoadingState());
    var response = await luchesRepo.getLunchesFormLocalDatabase();
    return response.fold((failure) {
      emit(LoadLauchesDataToLocalErorrState(error: failure.errMessage));
      return [];
    }, (lauches) {
      emit(LoadLauchesDataToLocalSuccessState(lauchess: lauches));
      return lauches;
    });
  }

  Future<void> getLauchess() async {
    emit(GetLauchessLoading());
    try {
      final localLaunchData = await loadLauchesssDataFromLocal();

      if (localLaunchData.isNotEmpty) {
        lauchesLocal = localLaunchData;
    
        emit(GetLauchessSuccess(
          lauches: localLaunchData,
        ));
      } else {
        var response = await luchesRepo.getLunches();

        response.fold((failure) {
          emit(GetLauchessError(
            error: failure.errMessage,
          ));
        }, (lauches) async {
          lauchesLocal = lauches;
      
          await saveLauchessDataToLocal(lauches);
          emit(GetLauchessSuccess(lauches: lauches));
        });
      }
    } catch (e) {
      emit(GetLauchessError(error: e.toString()));
    }
  }
}
