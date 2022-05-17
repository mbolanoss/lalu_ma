class Song {
  String id;
  String? name;
  String? album;
  String? artist;
  int? likes;
  int? year;

  Song({
    required this.id,
    this.name,
    this.album,
    this.artist,
    this.likes,
    this.year,
  });
}
