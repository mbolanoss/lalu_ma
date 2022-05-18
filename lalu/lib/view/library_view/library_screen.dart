import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/view/music_player_view/music_player_screen.dart';
import 'package:lalu/view_model/library_vm.dart';
import 'package:provider/provider.dart';

import '../../models/playlist.dart';
import '../../models/song.dart';
import '../../providers/music_player_provider.dart';
import '../../providers/music_player_state_provider.dart';
import '../../resources/colors.dart';
import '../../view_model/music_player_vm.dart';
import 'playlists_section.dart';

class LibraryScreen extends StatefulWidget {
  static const route = 'home';

  const LibraryScreen({Key? key}) : super(key: key);

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final LibraryVM libraryVM = LibraryVM();
  late Future<List<Playlist>> playlists;

  @override
  void didChangeDependencies() {
    final graphqlClient = GraphQLProvider.of(context).value;
    playlists = libraryVM.getPlaylists(graphqlClient, "srodrigueztr");

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final playerProvider = Provider.of<MusicPlayerProvider>(context);
    final playerStateProvider = Provider.of<MusicPlayerStateProvider>(context);

    final musicPlayerVM = MusicPlayerVM();

    return Scaffold(
      backgroundColor: deepBlue,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: screenSize.width * 0.05),
          child: Column(
            children: [
              //Appbar space
              //TODO: put appbar
              SizedBox(height: screenSize.height * 0.08),

              //Screen title
              const _SectionTitle(title: 'Your music'),
              const Divider(color: gray, thickness: 5),

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
                    })),
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
