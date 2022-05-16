import 'package:flutter/material.dart';
import 'package:lalu/resources/colors.dart';

import 'song_info.dart';

class MusicPlayerScreen extends StatelessWidget {
  static const route = 'music_player';

  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [darkBlue, lightPurple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
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
                  //TODO: Replace with progress bar
                  child: Slider(
                    value: 5,
                    onChanged: (val) {},
                    min: 0,
                    max: 10,
                  ),
                ),

                //Song info
                SongInfo(),
              ],
            ),
          ),
        ),
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
            const NetworkImage('https://via.placeholder.com/200'),
        radius: screenSize.width * 0.3,
      ),
    );
  }
}
