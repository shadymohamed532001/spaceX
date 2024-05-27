import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:spacex/core/theming/colors.dart';
import 'package:spacex/core/theming/image_assets.dart';
import 'package:spacex/core/theming/styles.dart';
import 'package:spacex/core/widgets/app_bottom.dart';
import 'package:spacex/feature/lunches/data/model/launch_model.dart';
import 'package:spacex/feature/lunches/ui/widgets/custom_detials_row.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LuchesBottomSheet extends StatefulWidget {
  const LuchesBottomSheet({
    super.key,
    required this.launchMode,
  });
  final LaunchModel launchMode;

  @override
  State<LuchesBottomSheet> createState() => _LuchesBottomSheetState();
}

class _LuchesBottomSheetState extends State<LuchesBottomSheet> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId =
        YoutubePlayer.convertUrlToId(widget.launchMode.links!.webcast!);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
    super.initState();
  }

  void _playVideo() {
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: ColorManger.blackColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.launchMode.name!,
                style: AppStyle.font18Whitesemibold,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                widget.launchMode.details!,
                style: AppStyle.font13Greysemibold,
              ),
              const SizedBox(
                height: 10,
              ),
              const CustomDetialsRow(
                title: 'Company',
                subtitle: 'SpaceX',
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDetialsRow(
                title: 'success',
                subtitle: widget.launchMode.autoUpdate!.toString(),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomDetialsRow(
                title: 'date local',
                subtitle: widget.launchMode.dateUtc.toString(),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        luchUrl(theUrl: widget.launchMode.links!.wikipedia!);
                      },
                      child: Image.asset(
                        ImagesAssetsManager.wikipedia,
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        luchUrl(theUrl: widget.launchMode.links!.webcast!);
                      },
                      child: Image.asset(
                        ImagesAssetsManager.youtube,
                        height: 40,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        luchUrl(theUrl: widget.launchMode.links!.article!);
                      },
                      child: Image.asset(
                        ImagesAssetsManager.link,
                        height: 35,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: ColorManger.greyColor.withOpacity(0.2),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: YoutubePlayer(
                          controller: _controller,
                          showVideoProgressIndicator: false,
                          onReady: () {
                            log('Player is ready.');
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          'Video Description of DemoSat Launch',
                          style: AppStyle.font10WhiteRegular
                              .copyWith(fontSize: 13),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Center(
                        child: CustomBottom(
                          bottomWidth: MediaQuery.of(context).size.width * 0.88,
                          bottomHeight:
                              MediaQuery.of(context).size.width * 0.12,
                          bottomtext: 'Play Video',
                          onPressed: () {
                            _playVideo();
                          },
                          backgroundColor: Colors.transparent,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  luchUrl({required String theUrl}) async {
    Uri url = Uri.parse(theUrl);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
