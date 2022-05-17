import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/repository/song_repo.dart';

class MusicPlayerVM {
  SongRepo songRepo = SongRepo();

  Future<String> fetchSongUrl(String songId, GraphQLClient client) async {
    QueryResult result = await songRepo.fetchSongBytes(client, songId);

    final url = result.data!['getSongFile'] as String;

    return url;
  }
}
