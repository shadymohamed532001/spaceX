import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/feature/dragons/logic/get_dragons_cubit/get_dragons_cubit.dart';
import 'package:spacex/feature/dragons/ui/widgets/custom_error_widgets.dart';

import 'custom_loading_indicator.dart';
import 'dragons_item.dart';

class DragonsItemListView extends StatelessWidget {
  const DragonsItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetDragonsCubit, GetDragonsState>(
      builder: (context, state) {
        if (state is GetDragonsLoadingState) {
          return const CustomLoadingIndicator();
        } else if (state is GetDragonsSuccessState) {
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.dragons.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.pushNamed(context, '/dragonDetails');
                  },
                  child: DragonsItem(
                    index: index,
                    dragons: state.dragons[index],
                  ),
                );
              });
        } else if (state is GetDragonsErrorState) {
          return CustomErrorWidget(errMessage: state.error.toString());
        } else {
          return Container();
        }
      },
    );
  }
}
