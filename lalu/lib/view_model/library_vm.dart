import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/repository/library_repo.dart';
import 'dart:convert';

class LibraryVM {
  final libraryRepo = LibraryRepo();

  Future<void> getPlaylists(GraphQLClient client, String username) async {
    final result = await libraryRepo.getUserPlaylists(client, username);

    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String prettyprint = encoder.convert(result.data);
    print(prettyprint);

    //print(result.data);
  }
}
