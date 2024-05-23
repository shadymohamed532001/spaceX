import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex/core/theming/styles.dart';
import 'package:spacex/feature/crew/data/models/crew_models.dart';

class CustomCrewItem extends StatelessWidget {
  const CustomCrewItem({
    super.key,
    required this.crewModel,
  });
  final CrewModel crewModel;

  void _showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showImageDialog(context, crewModel.image);
      },
      child: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: crewModel.image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                crewModel.name,
                style: AppStyle.font14Whitesemibold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
