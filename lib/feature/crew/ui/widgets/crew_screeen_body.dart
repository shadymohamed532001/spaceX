import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/feature/crew/logic/crew_cubit.dart';
import 'package:spacex/feature/crew/ui/widgets/custom_crew_item.dart';

class CrewScreenBody extends StatelessWidget {
  const CrewScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CrewCubit, CrewState>(
      builder: (context, state) {
        CrewCubit cubit = BlocProvider.of<CrewCubit>(context);
        if (state is GetCrewsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetCrewsError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is GetCrewsSuccess || state is GetCrewsSuccessFromLocal) {
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return CustomCrewItem(
                      crewModel: cubit.crewLocal[index],
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('Something went wrong'),
          );
        }
      },
    );
  }
}



