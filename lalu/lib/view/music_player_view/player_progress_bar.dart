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

        //generating the duration label
        /* int shours = Duration(milliseconds: currentpos).inHours;
        int sminutes = Duration(milliseconds: currentpos).inMinutes;
        int sseconds = Duration(milliseconds: currentpos).inSeconds;

        int rhours = shours;
        int rminutes = sminutes - (shours * 60);
        int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);

        currentpostlabel = "$rhours:$rminutes:$rseconds"; */

        setState(() {});
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
      //value: currentPosition.toDouble(),
      value: currentPosition.toDouble(),
      onChanged: (val) {},
      min: 0,
      max: maxDuration.toDouble(),
    );
  }
}
