import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex/feature/lunches/logic/lauches_cubit.dart';

import 'package:spacex/feature/lunches/ui/widgets/custom_luches_item.dart';

class LunchesScreenBody extends StatelessWidget {
  const LunchesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LauchesCubit, LauchesState>(
      builder: (context, state) {
        LauchesCubit cubit = BlocProvider.of<LauchesCubit>(context);
        if (state is GetLauchessLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetLauchessError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is GetLauchessSuccess ||
            state is GetLauchessSuccessFromLocal) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CustomScrollView(
              slivers: [
                SliverList.builder(
                  itemCount: cubit.lauchesLocal.length,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: CustomLuchesItem(
                        lauches: cubit.lauchesLocal[index],
                      ),
                    );
                  },
                )
              ],
            ),
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
// }
// if (state is GetRocketsSuccess || state is GetRocketsSuccessFromLocal) {
//           return Padding(
//             padding: EdgeInsets.only(
//               left: 16.w,
//               right: 16.w,
//             ),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: cubit.rocketsLocal.length,
//                     itemBuilder: (context, index) {
//                       return RocketLauncherItem(
//                         rocketModel: cubit.rocketsLocal[index],
//                         onTap: () {
//                           context.navigateTo(
//                               routeName: Routes.rocketScreenDetailsRoute,
//                               arguments: cubit.rocketsLocal[index]);
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         } else {
//           return const Center(
//             child: Text('Something went wrong'),
//           );
//         }