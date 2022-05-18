import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/resources/colors.dart';
import 'package:lalu/view/music_player_view/music_player_screen.dart';
import 'package:lalu/view/playlist_view/playlist_screen.dart';
import 'package:provider/provider.dart';

import '../../models/playlist.dart';
import '../../providers/music_player_provider.dart';
import '../../providers/music_player_state_provider.dart';
import '../../view_model/music_player_vm.dart';

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
      radius: const Radius.circular(20),
      child: GridView.builder(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 10),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: screenSize.width * 0.08,
            mainAxisSpacing: screenSize.height * 0.02,
            childAspectRatio: 2.2,
          ),
          itemCount: playlists.length,
          itemBuilder: (_, index) {
            return _PlaylistCard(playlist: playlists[index]);
          }),
    );
  }
}

class _PlaylistCard extends StatelessWidget {
  final Playlist playlist;

  const _PlaylistCard({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final playerProvider = Provider.of<MusicPlayerProvider>(context);
    final playerStateProvider = Provider.of<MusicPlayerStateProvider>(context);

    final musicPlayerVM = MusicPlayerVM();

    final graphqlClient = GraphQLProvider.of(context).value;

    return Container(
      decoration: BoxDecoration(
        color: darkPurple,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                    'https://i.scdn.co/image/ab67616d0000b2730c4e5466bfc37b1049f9307b'),
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    primary: darkBlue,
                  ),
                  onPressed: () {
                    playerStateProvider.replaceQueue(playlist.songs);

                    musicPlayerVM.prepareSongPlayer(
                        playerProvider, playerStateProvider, graphqlClient);

                    Navigator.of(context).pushNamed(MusicPlayerScreen.route);
                  },
                  child: Icon(Icons.play_arrow),
                ),
              ),
            ],
          ),
          SizedBox(
            width: screenSize.width * 0.01,
          ),
          Expanded(
            child: GestureDetector(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    playlist.name,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.01,
                  ),
                  Text(
                    '${playlist.songs.length} songs',
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              onTap: () {
                Navigator.of(context).pushNamed(
                  PlaylistScreen.route,
                  arguments: playlist,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
