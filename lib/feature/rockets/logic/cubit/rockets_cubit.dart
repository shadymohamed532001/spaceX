import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacex/feature/rockets/data/model/reocket_model.dart';
import 'package:spacex/feature/rockets/data/repositories/rockets_repo.dart';


part 'rockets_state.dart';

class RocketsCubit extends Cubit<RocketsState> {
  RocketsCubit({required this.rocketRepo}) : super(RocketsInitial());

  final RocketRepo rocketRepo;

  List<RocketModel> rocketesresult  = [];

    Future<void> savePlantDataToLocal(List<RocketModel> rockets) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonData = rockets.map((plant) => plant.toJson()).toList();
    prefs.setString('rockets', json.encode(jsonData));
  }

   Future<List<RocketModel>> loadRocketssDataFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('rockets');
    if (jsonString != null) {
      final jsonData = json.decode(jsonString);
      return jsonData
          .map<RocketModel>((plant) => RocketModel.fromJson(plant))
          .toList();
          
    } else {
      return [];
    }
  }

  Future<void> getRockets() async {
    emit(GetRocketsLoading());
    try {
      final localRocketData = await loadRocketssDataFromLocal();

      if (localRocketData.isNotEmpty) {
        rocketesresult = localRocketData;
      emit(GetRocketsSuccessFromLocal(
        rockets: rocketesresult,
      ));
      } else {
        final plantEither = await rocketRepo.getRockets();
        plantEither.fold(
          (failure) {
            emit(GetRocketsError(error: failure.errMessage));
          },
          (rocktes) async {
            rocketesresult = rocktes;
            emit(GetRocketsSuccess(rockets: rocketesresult));
            await savePlantDataToLocal(rocktes);
          },
        );
      }
    } catch (e) {
      emit(GetRocketsError(error: e.toString()));
    }
  }


}


  
