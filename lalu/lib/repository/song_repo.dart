import 'package:graphql_flutter/graphql_flutter.dart';

class SongRepo {
  Future<QueryResult> fetchSongBytes(GraphQLClient client, String songId) {
    const query = r"""
      query GetSongFile($getSongFileId: String!) {
        getSongFile(id: $getSongFileId)
      }
    """;

    final QueryOptions options = QueryOptions(
      document: gql(query),
      variables: <String, dynamic>{
        "getSongFileId": songId,
      },
    );

    return client.query(options);
  }
}
