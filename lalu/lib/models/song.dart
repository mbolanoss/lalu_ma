class Song {
  String id;
  String title = 'NoName';
  String album = 'NoAlbum';
  List<String> artists;
  int likes = 0;
  int year = 9999;
  int duration = 0;

  Song({
    required this.id,
    required this.title,
    required this.album,
    required this.artists,
    required this.likes,
    required this.year,
    required this.duration,
  });

  factory Song.fromJson(Map<String, dynamic> json) {
    DateTime releaseDate = DateTime.parse(json["releaseDate"]);
    return Song(
      id: json["_id"],
      title: json["title"],
      duration: json["duration"],
      artists: List<String>.from(json["artists"].map((x) => x)),
      album: json["album"],
      likes: json["likes"],
      year: releaseDate.year,
    );
  }
}
