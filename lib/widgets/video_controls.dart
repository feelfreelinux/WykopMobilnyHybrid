import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoControlsToolbar extends StatefulWidget {
  final VideoPlayerController controller;
  VideoControlsToolbar({@required this.controller});
  VideoControlsState createState() => VideoControlsState();
}

class VideoControlsState extends State<VideoControlsToolbar> {
  Duration currentTime = Duration();
  Duration duration = Duration();
  bool isPlaying = false;
  bool isLooping = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      final bool isPlaying = widget.controller.value.isPlaying;
      if (this.isPlaying != isPlaying) {
        setState(() {
          this.isPlaying = isPlaying;
        });
      }

      setPlayerState(widget.controller.value.isLooping,
          widget.controller.value.position, widget.controller.value.duration);
    });
  }

  void setPlayerState(bool isLooping, Duration currentTime, Duration duration) {
    setState(() {
      this.isLooping = isLooping;
      if (duration.inMilliseconds > currentTime.inMilliseconds) {
        this.currentTime = currentTime;
        this.duration = duration;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      _drawToolbarIcon(isPlaying ? Icons.pause : Icons.play_arrow, '', () {
        if (isPlaying) {
          widget.controller.pause();
        } else {
          widget.controller.play();
        }
      }),
      Expanded(
        child: Slider(
          activeColor: Theme.of(context).accentColor,
          value: currentTime.inMilliseconds.toDouble(),
          max: duration.inMilliseconds.toDouble(),
          onChanged: (value) =>
              widget.controller.seekTo(Duration(milliseconds: value.toInt())),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Text(
            "${currentTime.inMinutes}:${currentTime.inSeconds} / ${duration.inMinutes}:${duration.inSeconds}",
            style: TextStyle(color: Colors.grey)),
      ),
      _drawToolbarIcon(
          this.isLooping ? Icons.looks_one : Icons.loop, 'Zapętlij', () {
        setState(() {
          widget.controller.setLooping(!isLooping);
        });
      })
    ]);
  }

  Widget _drawToolbarIcon(
      IconData icon, String tooltip, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Tooltip(
          child: InkWell(child: Icon(icon), onTap: onPressed),
          message: tooltip),
    );
  }
}
