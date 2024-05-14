import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/feature/dragons/data/models/DragonModel.dart';

import '../../data/repositories/dragon_repo.dart';

part 'get_dragons_state.dart';

class GetDragonsCubit extends Cubit<GetDragonsState> {
  GetDragonsCubit({required this.dragonRepo}) : super(GetDragonsInitial());

  final DragonRepo dragonRepo;

  List<DragonModel> dragonsLocal = [];

  Future saveDragonDataToLocal(List<DragonModel> dragons) async {
    emit(SaveDragonDataToLocalLoadingState());
    var response = await dragonRepo.saveDragonsToLocalDatabase(dragonsLocal);
    response.fold((failure) {
      emit(SaveDragonDataToLocalErrorState(error: failure.errMessage));
      // print(failure.errMessage);
    }, (dragons) async {
      emit(SaveDragonDataToLocalSuccessState(dragons: dragons));
    });
  }

  Future<List<DragonModel>> loadDragonDataFromLocal() async {
    emit(LoadDragonDataToLocalLoadingState());
    var response = await dragonRepo.getDragonsFormLocalDatabase();
    return response.fold((failure) {
      emit(LoadDragonDataToLocalErrorState(error: failure.errMessage));
      return [];
    }, (dragons) {
      emit(LoadDragonDataToLocalSuccessState(dragons: dragons));
      return dragons;
    });
  }

  Future getAllDragons() async {
    emit(GetDragonsLoadingState());
    try {
      final localDragonsData = await loadDragonDataFromLocal();

      if (localDragonsData.isNotEmpty) {
        dragonsLocal = localDragonsData;
        emit(GetDragonsSuccessFromLocal(
          dragons: dragonsLocal,
        ));
      } else {
        var response = await dragonRepo.fetchDragons();

        response.fold((failure) {
          emit(GetDragonsErrorState(failure.errMessage));
        }, (dragons) async {
          dragonsLocal = dragons;
          await saveDragonDataToLocal(dragons);
          emit(GetDragonsSuccessState(dragons));
        });
      }
    } catch (e) {
      GetDragonsErrorState(e.toString());
    }
  }
}
