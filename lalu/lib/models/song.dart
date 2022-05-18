class Song {
  String id;
  String? name;
  String? album;
  List<String> artists;
  int? likes;
  int? year;
  int? duration;

  Song({
    required this.id,
    this.name,
    this.album,
    required this.artists,
    this.likes,
    this.year,
    this.duration,
  });
}
