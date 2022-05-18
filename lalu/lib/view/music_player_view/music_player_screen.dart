import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lalu/providers/music_player_provider.dart';
import 'package:lalu/resources/colors.dart';
import 'package:provider/provider.dart';

import 'player_bottom_app_bar.dart';
import 'player_progress_bar.dart';
import 'song_info.dart';

class MusicPlayerScreen extends StatelessWidget {
  static const route = 'music_player';

  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final playerProvider = Provider.of<MusicPlayerProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        await playerProvider.stop();
        return true;
      },
      child: Scaffold(
        backgroundColor: lightPurple,
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [deepBlue, lightPurple],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.2, 0.95],
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  //Image
                  Container(
                    margin: EdgeInsets.only(
                      bottom: screenSize.height * 0.035,
                    ),
                    child: const _SongImage(),
                  ),

                  //Player progress bar
                  Container(
                    margin: EdgeInsets.only(bottom: screenSize.height * 0.035),
                    child: const PlayerProgressBar(),
                  ),

                  //Song info
                  const SongInfo(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: BottomAppBar(
            color: darkPurple,
            child: BottomAppBarContent(),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: darkBlue,
          child: Icon(
            playerProvider.playerState == PlayerState.PLAYING
                ? Icons.pause
                : Icons.play_arrow,
            size: 50,
          ),
          onPressed: () async {
            final state = playerProvider.playerState;

            if (state == PlayerState.STOPPED || state == PlayerState.PAUSED) {
              await playerProvider.playUrl();
            } else {
              playerProvider.pause();
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}

class _SongImage extends StatelessWidget {
  const _SongImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: screenSize.height * 0.1),
      child: CircleAvatar(
        backgroundImage:
            //TODO: Replace with real image
            const NetworkImage(
                'https://www.eltiempo.com/files/image_640_428/uploads/2021/10/12/6165ee71775ad.jpeg'),
        radius: screenSize.width * 0.3,
      ),
    );
  }
}
