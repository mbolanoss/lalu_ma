import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/models/playlist.dart';
import 'package:lalu/repository/library_repo.dart';

class LibraryVM {
  final libraryRepo = LibraryRepo();

  Future<List<Playlist>> getPlaylists(
      GraphQLClient client, String username) async {
    final result = await libraryRepo.getUserPlaylists(client, username);

    final List<dynamic> playlistsJson =
        result.data!['getAllUsernamePlaylistsAlbums'];

    final List<Playlist> parsedPlaylists = [];

    for (Map<String, dynamic> rawPlaylist in playlistsJson) {
      parsedPlaylists.add(Playlist.fromJson(rawPlaylist));
    }

    return parsedPlaylists;
  }
}
