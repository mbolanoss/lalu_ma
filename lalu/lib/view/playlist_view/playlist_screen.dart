import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/models/playlist.dart';
import 'package:provider/provider.dart';

import '../../providers/music_player_provider.dart';
import '../../providers/music_player_state_provider.dart';
import '../../resources/colors.dart';
import '../../view_model/music_player_vm.dart';
import '../music_player_view/music_player_screen.dart';

class PlaylistScreen extends StatelessWidget {
  static const route = 'playlist';

  const PlaylistScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playlist = ModalRoute.of(context)!.settings.arguments as Playlist;
    final screenSize = MediaQuery.of(context).size;

    final playerProvider = Provider.of<MusicPlayerProvider>(context);
    final playerStateProvider = Provider.of<MusicPlayerStateProvider>(context);
    final graphqlClient = GraphQLProvider.of(context).value;

    final musicPlayerVM = MusicPlayerVM();

    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [deepBlue, lightPurple],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.2, 0.95],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: screenSize.height * 0.08),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  playlist.name,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${playlist.songs.length} songs',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const Divider(color: gray, thickness: 6),
              ListView.builder(
                shrinkWrap: true,
                itemCount: playlist.songs.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (_, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(playlist.songs[index].title),
                        subtitle: Text(playlist.songs[index].artists[0]),
                        trailing: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            primary: darkBlue,
                          ),
                          onPressed: () {
                            final song = [playlist.songs[index]];
                            playerStateProvider.replaceQueue(song);

                            musicPlayerVM.prepareSongPlayer(playerProvider,
                                playerStateProvider, graphqlClient);

                            Navigator.of(context)
                                .pushNamed(MusicPlayerScreen.route);
                          },
                          child: Icon(Icons.play_arrow),
                        ),
                      ),
                      const Divider(color: gray, thickness: 3),
                    ],
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
