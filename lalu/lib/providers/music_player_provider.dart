import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicPlayerProvider extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();
  double playerVolume = 1.0;

  Stream<Duration> get positionStream {
    return _player.onAudioPositionChanged;
  }

  Stream<Duration> get durationStream {
    return _player.onDurationChanged;
  }

  Stream<void> get completionStream {
    return _player.onPlayerCompletion;
  }

  PlayerState get playerState {
    return _player.state;
  }

  Future<int> get duration {
    return _player.getDuration();
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

  Future<int> setUrl(String url) async {
    int result = await _player.setUrl(url);

    return result;
  }

  Future<int> playUrl() async {
    int result = await _player.resume();

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

  Future seek(int seekValue) async {
    await _player.seek(Duration(milliseconds: seekValue));
  }
}
