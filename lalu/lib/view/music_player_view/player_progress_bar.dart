import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/music_player_provider.dart';
import '../../providers/music_player_state_provider.dart';
import '../../resources/colors.dart';
import '../../view_model/music_player_vm.dart';

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
  final musicPlayerVM = MusicPlayerVM();

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      final playerProvider =
          Provider.of<MusicPlayerProvider>(context, listen: false);
      final playerStateProvider =
          Provider.of<MusicPlayerStateProvider>(context, listen: false);

      final graphqlClient = GraphQLProvider.of(context).value;

      playerProvider.durationStream.listen((Duration d) {
        maxDuration = d.inMilliseconds;
        if (mounted) {
          setState(() {});
        }
      });

      playerProvider.positionStream.listen((Duration p) {
        if (p.inMilliseconds < maxDuration) {
          currentPosition = p.inMilliseconds;
          if (mounted) {
            setState(() {});
          }
        }
      });

      playerProvider.completionStream.listen((event) async {
        playerProvider.pause();
        bool isOnRepeat = playerStateProvider.onRepeat;

        if (isOnRepeat) {
          await playerProvider.seek(0);
          await playerProvider.playUrl();
          return;
        }

        bool nextSong = playerStateProvider.nextSong();

        if (nextSong) {
          await musicPlayerVM.prepareSongPlayer(
              playerProvider, playerStateProvider, graphqlClient);
          await playerProvider.playUrl();
          return;
        }
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
      inactiveColor: darkGray,
      value: currentPosition.toDouble(),
      onChanged: (value) async {
        await playerProvider.seek(value.round());
      },
      min: 0,
      max: maxDuration.toDouble(),
    );
  }
}
