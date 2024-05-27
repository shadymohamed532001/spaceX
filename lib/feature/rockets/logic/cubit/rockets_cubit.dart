import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/feature/rockets/data/model/reocket_model.dart';
import 'package:spacex/feature/rockets/data/repositories/rockets_repo.dart';

part 'rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  RocketsCubit({required this.rocketRepo}) : super(RocketsInitial());

  final RocketRepo rocketRepo;

  List<RocketModel> rocketsLocal = [];

  Future<void> saveRocketsDataToLocal(List<RocketModel> rockets) async {
    emit(SaveRocketDataToLocalLoadingState());
    var response = await rocketRepo.saveRocketsToLocalDatabase(rockets);
    response.fold((failure) {
      emit(SaveRocketDataToLocalErrorState(error: failure.errMessage));
    }, (rockets) async {
      emit(SaveRocketDataToLocalSuccessState(rockets: rockets));
    });
  }

  Future<List<RocketModel>> loadRocketssDataFromLocal() async {
    emit(LoadRocketDataToLocalLoadingState());
    var response = await rocketRepo.getRocketsFormLocalDatabase();
    return response.fold((failure) {
      emit(LoadRocketDataToLocalErorrState(error: failure.errMessage));
      return [];
    }, (rockets) {
      emit(LoadRocketDataToLocalSuccessState(rockets: rockets));
      return rockets;
    });
  }

  Future<void> getRockets() async {
    emit(GetRocketsLoading());
    try {
      // Step 1: Fetch the latest data from the remote source
      var response = await rocketRepo.getRockets();
      response.fold((failure) async {
        // Step 2: If remote fetch fails, fallback to local data
        final localRocketsData = await loadRocketssDataFromLocal();
        if (localRocketsData.isNotEmpty) {
          rocketsLocal = localRocketsData;
          emit(GetRocketsSuccess(rockets: rocketsLocal));
        } else {
          emit(GetRocketsError(error: failure.errMessage));
        }
      }, (rockets) async {
        // Step 3: If remote fetch succeeds, compare and update local database if needed
        rocketsLocal = rockets;
        await saveRocketsDataToLocal(rockets);
        emit(GetRocketsSuccess(rockets: rockets));
      });
    } catch (e) {
      // Handle any unexpected errors
      emit(GetRocketsError(error: e.toString()));
    }
  }
}

// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:spacex/feature/rockets/data/model/reocket_model.dart';
// import 'package:spacex/feature/rockets/data/repositories/rockets_repo.dart';

// part 'rockets_state.dart';

// class RocketsCubit extends Cubit<RocketsState> {
//   RocketsCubit({required this.rocketRepo}) : super(RocketsInitial());

//   final RocketRepo rocketRepo;

//   List<RocketModel> rocketsLocal = [];
//   Future<void> saveRocketsDataToLocal(List<RocketModel> rockets) async {
//     emit(SaveRocketDataToLocalLoadingState());
//     var response = await rocketRepo.saveRocketsToLocalDatabase(rockets);
//     response.fold((failure) {
//       emit(SaveRocketDataToLocalErrorState(error: failure.errMessage));
//     }, (rockets) async {
//       emit(SaveRocketDataToLocalSuccessState(rockets: rockets));
//     });
//   }

//   Future<List<RocketModel>> loadRocketssDataFromLocal() async {
//     emit(LoadRocketDataToLocalLoadingState());
//     var response = await rocketRepo.getRocketsFormLocalDatabase();
//     return response.fold((failure) {
//       emit(LoadRocketDataToLocalErorrState(error: failure.errMessage));
//       return [];
//     }, (rockets) {
//       emit(LoadRocketDataToLocalSuccessState(rockets: rockets));
//       return rockets;
//     });
//   }


//   Future<void> getRockets() async {
//     emit(GetRocketsLoading());
//     try {
//       final localRocketsData = await loadRocketssDataFromLocal();

//       if (localRocketsData.isNotEmpty) {
//         rocketsLocal = localRocketsData;
//         emit(GetRocketsSuccess(
//           rockets: rocketsLocal,
//         ));
//       } else {
//         var response = await rocketRepo.getRockets();

//         response.fold((failure) {
//           emit(GetRocketsError(
//             error: failure.errMessage,
//           ));
//         }, (rockets) async {
//           rocketsLocal = rockets;
//           await saveRocketsDataToLocal(rockets);
//           emit(GetRocketsSuccess(rockets: rockets));
//         });
//       }
//     } catch (e) {
//       emit(GetRocketsError(error: e.toString()));
//     }
//   }
// }
