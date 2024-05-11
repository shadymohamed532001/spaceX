import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spacex/core/helpers/naviagtion_extentaions.dart';
import 'package:spacex/core/routing/routes.dart';
import 'package:spacex/feature/rockets/logic/cubit/rockets_cubit.dart';
import 'package:spacex/feature/rockets/ui/widgets/rocket_launcher_item.dart';

class RocketsScreenBody extends StatefulWidget {
  const RocketsScreenBody({super.key});

  @override
  State<RocketsScreenBody> createState() => _RocketsScreenBodyState();
}

class _RocketsScreenBodyState extends State<RocketsScreenBody> {
  @override
  void initState() {
    BlocProvider.of<RocketsCubit>(context).getRockets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RocketsCubit, RocketsState>(
      builder: (context, state) {
        RocketsCubit cubit = BlocProvider.of<RocketsCubit>(context);
        if (state is GetRocketsError) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetRocketsError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is GetRocketsSuccess || state is GetRocketsSuccessFromLocal) {
          return Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.rocketesresult.length,
                    itemBuilder: (context, index) {
                      return RocketLauncherItem(
                        rocketModel: cubit.rocketesresult[index],
                        onTap: () {
                          context.navigateTo(
                              routeName: Routes.rocketScreenDetailsRoute,
                              arguments: cubit.rocketesresult[index]);
                        },
                      );
                    },
                  ),
                ),
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
