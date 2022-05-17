import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/music_player_provider.dart';
import '../../resources/colors.dart';

class PlayerProgressBar extends StatefulWidget {
  const PlayerProgressBar({
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerProgressBar> createState() => _PlayerProgressBarState();
}

class _PlayerProgressBarState extends State<PlayerProgressBar> {
  int currentPosition = 0;
  int maxDuration = 100;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final playerProvider =
          Provider.of<MusicPlayerProvider>(context, listen: false);

      playerProvider.durationStream.listen((Duration d) {
        maxDuration = d.inMilliseconds;
        setState(() {});
      });
      playerProvider.positionStream.listen((Duration p) {
        currentPosition = p.inMilliseconds;
        setState(() {});
      });
      playerProvider.completionStream.listen((event) {
        playerProvider.pause();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final playerProvider =
        Provider.of<MusicPlayerProvider>(context, listen: false);

    return Slider(
      thumbColor: Colors.white,
      activeColor: lightPink,
      value: currentPosition.toDouble(),
      onChanged: (value) async {
        final intVal = value.round();
        if (intVal <= maxDuration) {
          await playerProvider.seek(value.round());
        }
      },
      min: 0,
      max: maxDuration.toDouble() + 100,
    );
  }
}
