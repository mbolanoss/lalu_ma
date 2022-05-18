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

  factory Playlist.fromJson(Map<String, dynamic> json) => Playlist(
        name: json["playlist_name"],
        songs: List<Song>.from(
          json["playlist_songs"].map(
            (x) => Song.fromJson(x),
          ),
        ),
      );
}
