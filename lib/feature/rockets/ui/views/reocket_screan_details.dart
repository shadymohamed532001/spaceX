import 'package:flutter/material.dart';
import 'package:spacex/feature/rockets/data/model/reocket_model.dart';
import 'package:spacex/feature/rockets/ui/widgets/rocket_details_bottom_sheet.dart';

class RocketScreenDetails extends StatelessWidget {
  const RocketScreenDetails({super.key, required this.rocketModel});

  final RocketModel rocketModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Image.network(
            rocketModel.flickrImages[0].toString(),
            height: MediaQuery.of(context).size.height * 0.42,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ],
      ),
      bottomSheet: RocketDetailBottomSheet(
        rocketModel: rocketModel,
        keys: const [
          'height,ft',
          'height,m',
          'diameter,ft',
          'diameter,m',
          'burn,sec',
          'burn,lb'
        ],
        values: [
          rocketModel.height.meters.toString(),
          rocketModel.height.feet.toString(),
          rocketModel.diameter.feet.toString(),
          rocketModel.height.meters.toString(),
          rocketModel.firstStage.burnTimeSec.toString(),
          rocketModel.secondStage.burnTimeSec.toString(),
        ],
      ),
    );
  }
}
