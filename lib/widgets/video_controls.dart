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
        setState(() => this.isPlaying = isPlaying);
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
    var durMin = duration.inMinutes.toString().padLeft(2, '0');
    var durSec = duration.inSeconds.toString().padLeft(2, '0');
    var curMin = currentTime.inMinutes.toString().padLeft(2, '0');
    var curSec = currentTime.inSeconds.toString().padLeft(2, '0');

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Row(
        children: <Widget>[
          _drawToolbarIcon(
            isPlaying ? Icons.pause : Icons.play_arrow,
            isPlaying ? 'Pauza' : 'Odtwórz',
            () {
              if (isPlaying) {
                widget.controller.pause();
              } else {
                widget.controller.play();
              }
            },
          ),
          _drawTime(curMin, curSec),
          _drawSlider(),
          _drawTime(durMin, durSec),
          _drawToolbarIcon(
            isLooping ? Icons.repeat : Icons.repeat_one,
            isLooping ? 'Nie powtarzaj' : 'Powtórz',
            () => setState(() => widget.controller.setLooping(!isLooping)),
          )
        ],
      ),
    );
  }

  Widget _drawSlider() {
    return Expanded(
      child: Stack(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 0.6, left: 0.6),
            child: IgnorePointer(
              child: Slider(
                activeColor: Theme.of(context).backgroundColor.withOpacity(0.8),
                inactiveColor:
                    Theme.of(context).backgroundColor.withOpacity(0.8),
                value: currentTime.inMilliseconds.toDouble(),
                max: duration.inMilliseconds.toDouble(),
                onChanged: (value) => widget.controller
                    .seekTo(Duration(milliseconds: value.toInt())),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 0.6),
            child: Slider(
              activeColor: Theme.of(context).iconTheme.color,
              inactiveColor: Theme.of(context).iconTheme.color,
              value: currentTime.inMilliseconds.toDouble(),
              max: duration.inMilliseconds.toDouble(),
              onChanged: (value) => widget.controller
                  .seekTo(Duration(milliseconds: value.toInt())),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawTime(var min, var sec) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 0.6,
            top: 0.6,
            child: Text(
              "$min:$sec",
              style: TextStyle(
                color: Theme.of(context).backgroundColor.withOpacity(0.8),
              ),
            ),
          ),
          Text(
            "$min:$sec",
            style: TextStyle(color: Theme.of(context).iconTheme.color),
          ),
        ],
      ),
    );
  }

  Widget _drawToolbarIcon(
      IconData icon, String tooltip, VoidCallback onPressed) {
    return Material(
      type: MaterialType.transparency,
      child: Tooltip(
        message: tooltip,
        child: InkWell(
          borderRadius: BorderRadius.circular(30.0),
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 0.6,
                  top: 0.6,
                  child: Icon(
                    icon,
                    size: 28.0,
                    color: Theme.of(context).backgroundColor.withOpacity(0.8),
                  ),
                ),
                Icon(icon, size: 28.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
