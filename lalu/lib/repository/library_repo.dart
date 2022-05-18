import 'package:graphql_flutter/graphql_flutter.dart';

class LibraryRepo {
  Future<QueryResult> getUserPlaylists(GraphQLClient client, String username) {
    //TODO: Change to the correct query
    const query = r"""
    query GetAllUsernamePlaylistsAlbums($playlistUsername: String!) {
      getAllUsernamePlaylistsAlbums(playlist_username: $playlistUsername) {
        playlist_name
        playlist_songs {
          _id
          title
          duration
          artists
          album
          likes
          releaseDate
        }
      }
    }
    """;

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: <String, dynamic>{
        "playlistUsername": username,
      },
    );

    return client.query(options);
  }
}
