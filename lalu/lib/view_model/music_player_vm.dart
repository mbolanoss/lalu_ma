import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/providers/music_player_provider.dart';
import 'package:lalu/providers/music_player_state_provider.dart';
import 'package:lalu/repository/song_repo.dart';

import '../models/song.dart';

class MusicPlayerVM {
  SongRepo songRepo = SongRepo();

  Future<String> fetchSongUrl(String songId, GraphQLClient client) async {
    QueryResult result = await songRepo.fetchSongBytes(client, songId);

    final url = result.data!['getSongFile'] as String;

    return url;
  }

  //Used to change the current song to another one
  Future<void> prepareSongPlayer(
    MusicPlayerProvider playerProvider,
    MusicPlayerStateProvider stateProvider,
    GraphQLClient client,
  ) async {
    final songUrl = await fetchSongUrl(stateProvider.currentSong()!.id, client);

    await playerProvider.setUrl(songUrl);
  }
}
