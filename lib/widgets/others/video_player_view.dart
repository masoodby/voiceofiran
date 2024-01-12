import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../controller/video_player_screen_controller/video_player_screen_controller.dart';
import '../../main.dart';
import '../../utils/basic_screen_imports.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    Key? key,
    required this.url,
    required this.dataSourceType,
  }) : super(key: key);

  final String url;
  final DataSourceType dataSourceType;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  final controller = Get.put(VideoPlayerScreenController());
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  final double _aspectRatio = 16 / 9;

  @override
  void initState() {
    super.initState();

    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        _videoPlayerController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        _videoPlayerController =
            VideoPlayerController.networkUrl(Uri.parse(widget.url));
        break;
      case DataSourceType.file:
        _videoPlayerController = VideoPlayerController.file(File(widget.url));
        break;
      case DataSourceType.contentUri:
        _videoPlayerController =
            VideoPlayerController.contentUri(Uri.parse(widget.url));
        break;
    }

    _chewieController = ChewieController(
      allowedScreenSleep: false,
      allowFullScreen: true,
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.landscapeRight,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
      videoPlayerController: _videoPlayerController,
      aspectRatio: _aspectRatio,
      autoPlay: true,
      looping: false,
      isLive: true,
    );

    _chewieController.addListener(() {
      if (_chewieController.isFullScreen) {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.landscapeRight,
          DeviceOrientation.landscapeLeft,
        ]);
      } else {
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      }
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(
          aspectRatio: _aspectRatio,
          child: Chewie(
            controller: _chewieController,
          ),
        ),
        Visibility(
          visible: DeviceInfo.isTv,
          child: Positioned(
            bottom: 12,
            right: 5,
            child: FloatingActionButton(
              elevation: 0,
              backgroundColor: Colors.transparent,
              onPressed: () {
                _chewieController.enterFullScreen();
              },
              child: const Icon(
                Icons.fullscreen,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
