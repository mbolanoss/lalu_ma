import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/view/music_player_view/music_player_screen.dart';
import 'package:provider/provider.dart';

import '../../models/song.dart';
import '../../providers/music_player_provider.dart';
import '../../providers/music_player_state_provider.dart';
import '../../view_model/music_player_vm.dart';

class HomeScreen extends StatelessWidget {
  static const route = 'home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final playerProvider = Provider.of<MusicPlayerProvider>(context);
    final playerStateProvider = Provider.of<MusicPlayerStateProvider>(context);

    final graphqlClient = GraphQLProvider.of(context).value;
    final musicPlayerVM = MusicPlayerVM();

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Play song'),
          onPressed: () async {
            /* playerStateProvider
                .addSongToQueue(Song(id: "6273e6963c6b1aeee792e951"));

            final songUrl = await musicPlayerVM.fetchSongUrl(
                playerStateProvider.currentSong!.id, graphqlClient);

            await playerProvider.setUrl(songUrl); */

            playerStateProvider
                .addSongToQueue(Song(id: "6273e6963c6b1aeee792e951"));
            playerStateProvider
                .addSongToQueue(Song(id: "62718e54b9621e3a0066d49f"));

            musicPlayerVM.prepareSongPlayer(
                playerProvider, playerStateProvider, graphqlClient);

            Navigator.of(context).pushNamed(MusicPlayerScreen.route);
          },
        ),
      ),
    );
  }
}
