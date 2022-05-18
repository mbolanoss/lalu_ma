import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lalu/view/music_player_view/music_player_screen.dart';
import 'package:provider/provider.dart';

import '../../models/song.dart';
import '../../providers/music_player_provider.dart';
import '../../providers/music_player_state_provider.dart';
import '../../resources/colors.dart';
import '../../view_model/music_player_vm.dart';
import 'playlists_section.dart';

class LibraryScreen extends StatelessWidget {
  static const route = 'home';

  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final playerProvider = Provider.of<MusicPlayerProvider>(context);
    final playerStateProvider = Provider.of<MusicPlayerStateProvider>(context);

    final graphqlClient = GraphQLProvider.of(context).value;
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
              _SectionTitle(title: 'Your music'),
              const Divider(color: gray, thickness: 5),

              //Playlists
              Container(
                margin: EdgeInsets.only(bottom: screenSize.height * 0.015),
                child: _SectionTitle(title: 'Playlists'),
              ),
              SizedBox(
                height: screenSize.height * 0.2,
                child: PlaylistsSection(),
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
