import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        if (state is RocketsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RocketsError) {
          return Center(
            child: Text(state.error),
          );
        }
        if (state is RocketsSuccess) {
          return Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.rockets.length,
                    itemBuilder: (context, index) {
                      return RocketLauncherItem(
                        rocketModel: state.rockets[index],
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
