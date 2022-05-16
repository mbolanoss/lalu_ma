import 'package:flutter/material.dart';
import 'package:lalu/resources/colors.dart';

class MusicPlayerScreen extends StatelessWidget {
  static const route = 'music_player';

  const MusicPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [darkBlue, lightPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: const Center(
          child: Text('Music'),
        ),
      ),
    );
  }
}
