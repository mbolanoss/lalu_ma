import 'package:flutter/material.dart';

class MusicPlayerScreen extends StatelessWidget {
  static const route = 'music_player';

  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Text('Music'),
      ),
    );
  }
}
