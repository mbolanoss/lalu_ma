import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/music_player_state_provider.dart';

class SongInfo extends StatelessWidget {
  const SongInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final playerStateProvider = Provider.of<MusicPlayerStateProvider>(context);

    return Column(
      children: [
        //Song name
        Text(
          playerStateProvider.currentSong()!.title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
        ),
        //Song artist
        Text(
          playerStateProvider.currentSong() != null
              ? playerStateProvider.currentSong()!.artists[0]
              : 'NoArtist',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
          overflow: TextOverflow.ellipsis,
        ),

        SizedBox(
          height: screenSize.height * 0.04,
        ),

        //Remaining song info
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //Album
          children: [
            _SongInfoPiece(
              name: 'Album',
              value: playerStateProvider.currentSong()!.album,
            ),
            _SongInfoPiece(
              name: 'Likes',
              value: playerStateProvider.currentSong()!.likes.toString(),
            ),
            _SongInfoPiece(
              name: 'Year',
              value: playerStateProvider.currentSong()!.year.toString(),
            ),
          ],
        )
      ],
    );
  }
}

class _SongInfoPiece extends StatelessWidget {
  final String name;
  final String value;
  const _SongInfoPiece({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        //Name
        Container(
          margin: EdgeInsets.only(bottom: screenSize.height * 0.015),
          padding: EdgeInsets.symmetric(vertical: screenSize.height * 0.002),
          width: screenSize.width * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xFFAD81CC),
          ),
          child: Text(
            name,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        //Value
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12),
        ),
      ],
    );
  }
}
