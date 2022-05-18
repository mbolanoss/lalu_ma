import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/resources/colors.dart';
import 'package:provider/provider.dart';

import '../../providers/music_player_provider.dart';
import '../../providers/music_player_state_provider.dart';
import '../../view_model/music_player_vm.dart';

class BottomAppBarContent extends StatelessWidget {
  final musicPlayerVM = MusicPlayerVM();

  BottomAppBarContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final playerProvider =
        Provider.of<MusicPlayerProvider>(context, listen: true);

    final playerStateProvider =
        Provider.of<MusicPlayerStateProvider>(context, listen: true);

    final graphqlClient = GraphQLProvider.of(context).value;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Player control buttons
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.shuffle),
              onPressed: () {},
            ),
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.skip_previous_outlined),
              onPressed: () async {
                bool previousSong = playerStateProvider.previousSong();

                if (previousSong) {
                  playerProvider.pause();
                  await musicPlayerVM.prepareSongPlayer(
                      playerProvider, playerStateProvider, graphqlClient);
                  await playerProvider.playUrl();
                }
              },
            ),

            //Empty space for play/pause button
            SizedBox(width: screenSize.width * 0.15),

            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.skip_next_outlined),
              onPressed: () async {
                bool nextSong = playerStateProvider.nextSong();

                if (nextSong) {
                  playerProvider.pause();
                  await musicPlayerVM.prepareSongPlayer(
                      playerProvider, playerStateProvider, graphqlClient);
                  await playerProvider.playUrl();
                }
              },
            ),
            IconButton(
              color: playerStateProvider.onRepeat ? deepBlue : Colors.white,
              icon: const Icon(Icons.repeat),
              onPressed: () {
                playerStateProvider.toggleRepeat();
              },
            ),
          ],
        ), //Volume control slider

        //Volume control slider
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.volume_down,
              color: Colors.white,
            ),
            Slider(
              activeColor: lightPink,
              thumbColor: Colors.white,
              value: playerProvider.playerVolume,
              onChanged: (volume) {
                playerProvider.setVolume(volume);
              },
              min: 0.0,
              max: 1.0,
            ),
            const Icon(
              Icons.volume_up,
              color: Colors.white,
            ),
          ],
        ),

        //Song interactions buttons
        Container(
          margin: EdgeInsets.only(bottom: screenSize.height * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Like button
              Ink(
                width: screenSize.width * 0.11,
                decoration: const ShapeDecoration(
                  color: Color(0xFFC09DC9),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  //highlightColor: Color(0xFFC09DC9),
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),

              SizedBox(width: screenSize.width * 0.1),

              //Share button
              Ink(
                width: screenSize.width * 0.11,
                decoration: const ShapeDecoration(
                  color: Color(0xFFC09DC9),
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
