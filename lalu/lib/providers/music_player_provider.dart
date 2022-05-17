import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicPlayerProvider extends ChangeNotifier {
  AudioPlayer player = AudioPlayer();

  PlayerState get playerState {
    return player.state;
  }

  Future<int> playBytes(Uint8List byteData) async {
    int result = await player.playBytes(byteData);
    return result;
  }

  Future<int> playUrl(String url) async {
    int result = await player.play(url);

    player.state = PlayerState.PLAYING;
    notifyListeners();

    return result;
  }

  Future<int> stop() async {
    int result = await player.stop();

    player.state = PlayerState.STOPPED;
    notifyListeners();

    return result;
  }

  Future<int> pause() async {
    int result = await player.pause();

    player.state = PlayerState.PAUSED;
    notifyListeners();

    return result;
  }

  Future<int> resume() async {
    int result = await player.resume();

    player.state = PlayerState.PLAYING;
    notifyListeners();

    return result;
  }
}
