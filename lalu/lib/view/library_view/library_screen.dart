import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/view_model/library_vm.dart';
import 'package:provider/provider.dart';

import '../../models/playlist.dart';
import '../../providers/session_provider.dart';
import '../../resources/colors.dart';
import 'playlists_section.dart';

class LibraryScreen extends StatefulWidget {
  static const route = 'library';

  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final LibraryVM libraryVM = LibraryVM();
  Future<List<Playlist>>? playlists;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final sessionProvider = Provider.of<SessionProvider>(context);

    final graphqlClient = GraphQLProvider.of(context).value;

    //playlists = libraryVM.getPlaylists(graphqlClient, sessionProvider.username);
    playlists = libraryVM.getPlaylists(graphqlClient, "srodrigueztr");

    return Scaffold(
      //backgroundColor: deepBlue,
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
            children: [
              //Appbar space
              //TODO: put appbar
              SizedBox(height: screenSize.height * 0.08),

              //Screen title
              const _SectionTitle(title: 'Your music'),
              const Divider(color: gray, thickness: 6),

              //Playlists
              Container(
                margin: EdgeInsets.only(bottom: screenSize.height * 0.015),
                child: const _SectionTitle(title: 'Playlists'),
              ),
              SizedBox(
                height: screenSize.height * 0.2,
                child: FutureBuilder<List<Playlist>>(
                  future: playlists,
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('Something went wrong'),
                        );
                      } else if (snapshot.hasData) {
                        return PlaylistsSection(playlists: snapshot.data!);
                      } else {
                        return const Text('You have no playlists');
                      }
                    } else {
                      return Text('State: ${snapshot.connectionState}');
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
