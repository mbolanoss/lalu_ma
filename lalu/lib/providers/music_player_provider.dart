import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicPlayerProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  double playerVolume = 1.0;

  PlayerState get playerState {
    return _player.state;
  }

  Future<int> setVolume(double newVolume) async {
    int result = await _player.setVolume(newVolume);
    playerVolume = newVolume;

    notifyListeners();
    return result;
  }

  Future<int> playBytes(Uint8List byteData) async {
    int result = await _player.playBytes(byteData);
    return result;
  }

  Future<int> playUrl(String url) async {
    int result = await _player.play(url);

    _player.state = PlayerState.PLAYING;
    notifyListeners();

    return result;
  }

  Future<int> stop() async {
    int result = await _player.stop();

    _player.state = PlayerState.STOPPED;
    notifyListeners();

    return result;
  }

  Future<int> pause() async {
    int result = await _player.pause();

    _player.state = PlayerState.PAUSED;
    notifyListeners();

    return result;
  }

  Future<int> resume() async {
    int result = await _player.resume();

    _player.state = PlayerState.PLAYING;
    notifyListeners();

    return result;
  }
}
