import 'package:flutter/material.dart';
import 'package:lalu/resources/colors.dart';

import '../../models/playlist.dart';

class PlaylistsSection extends StatelessWidget {
  List<Playlist> playlists;
  final _scrollController = ScrollController();

  PlaylistsSection({
    Key? key,
    required this.playlists,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scrollbar(
      thumbVisibility: true,
      controller: _scrollController,
      radius: Radius.circular(20),
      child: GridView.count(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        crossAxisSpacing: screenSize.width * 0.08,
        mainAxisSpacing: screenSize.height * 0.02,
        crossAxisCount: 2,
        childAspectRatio: 2.2,
        shrinkWrap: true,
        children: [
          _PlaylistCard(),
          _PlaylistCard(),
          _PlaylistCard(),
          _PlaylistCard(),
          _PlaylistCard(),
        ],
      ),
    );
  }
}

class _PlaylistCard extends StatelessWidget {
  final Playlist? playlist;

  const _PlaylistCard({
    Key? key,
    this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: darkPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network('https://via.placeholder.com/200'),
            ),
            SizedBox(
              width: screenSize.width * 0.03,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  playlist?.name ?? 'NoName',
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: screenSize.height * 0.01,
                ),
                Text(
                  '${playlist?.songs.length ?? 0} songs',
                  overflow: TextOverflow.ellipsis,
                )
              ],
            )
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
