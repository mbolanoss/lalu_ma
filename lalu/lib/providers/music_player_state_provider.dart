import 'package:flutter/material.dart';
import 'package:lalu/models/song.dart';

class MusicPlayerStateProvider extends ChangeNotifier {
  List<Song> _queue = [];
  int _currentSongIndex = 0;

  bool onRepeat = false;

  void toggleRepeat() {
    onRepeat = !onRepeat;
    notifyListeners();
  }

  Song? currentSong() {
    if (_queue.isEmpty) {
      return null;
    }
    return _queue[_currentSongIndex];
  }

  bool nextSong() {
    if (_queue.length <= 1 || _currentSongIndex == _queue.length - 1) {
      return false;
    }

    _currentSongIndex++;
    notifyListeners();

    return true;
  }

  bool previousSong() {
    if (_queue.length <= 1 || _currentSongIndex == 0) {
      return false;
    }

    _currentSongIndex--;
    notifyListeners();

    return true;
  }

  void addSongToQueue(Song song) {
    _queue.add(song);
  }

  void replaceQueue(List<Song> songs) {
    _queue = songs;
    _currentSongIndex = 0;

    notifyListeners();
  }
}
