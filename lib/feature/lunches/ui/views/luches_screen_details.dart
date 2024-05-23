import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spacex/feature/lunches/ui/widgets/luches_bottom_sheet.dart';

class LunchesScreenDetails extends StatelessWidget {
  const LunchesScreenDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: 'https://images2.imgbox.com/66/b4/8KZsjbt4_o.png',
              height: MediaQuery.of(context).size.height * 0.30,
              width: double.infinity,
              fit: BoxFit.scaleDown,
            ),
          ],
        ),
      ),
      bottomSheet: const LuchesBottomSheet(),
    );
  }
}
