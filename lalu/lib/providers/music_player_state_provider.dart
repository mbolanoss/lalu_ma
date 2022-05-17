import 'package:flutter/material.dart';
import 'package:lalu/models/song.dart';

class MusicPlayerStateProvider extends ChangeNotifier {
  late Song _currentSong;

  Song get currentSong {
    return _currentSong;
  }

  set currentSong(Song newSong) {
    _currentSong = newSong;
    notifyListeners();
  }
}
