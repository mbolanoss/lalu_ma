import 'song.dart';

class Playlist {
  String name;
  String? description;
  String? cover;
  List<Song> songs;

  Playlist({
    required this.name,
    this.description,
    this.cover,
    required this.songs,
  });
}
