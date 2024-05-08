import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/feature/dragons/data/models/DragonModel.dart';

import '../../data/repositories/dragon_repo.dart';

part 'get_dragons_state.dart';

class GetDragonsCubit extends Cubit<GetDragonsState> {
  GetDragonsCubit({required this.dragonRepo}) : super(GetDragonsInitial());

  final DragonRepo dragonRepo;

  Future getAllDragons() async {
    emit(GetDragonsLoadingState());

    var response = await dragonRepo.fetchDragons();

    response.fold((failure) {
      emit(GetDragonsErrorState(failure.errMessage));
    }, (dragons) {
      emit(GetDragonsSuccessState(dragons));
    });
  }
}
