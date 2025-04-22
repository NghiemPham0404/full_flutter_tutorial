// {
//   "id": "1121429554",
//   "title": "Chạy Về Khóc Với Anh",
//   "album": "Chạy Về Khóc Với Anh(Single)",
//   "artist": "ERIK",
//   "source": "https://thantrieu.com/resources/music/1121429554.mp3",
//   "image": "https://thantrieu.com/resources/arts/1121429554.webp",
//   "duration": 224,
//   "favorite": "false",
//   "counter": 20,
//   "replay": 0
// }
class Song{
  String id;
  String title;
  String album;
  String artist;
  String source;
  String image;
  int duration;
  // bool favorite;
  // int counter;
  // int replay;

  Song({
    required this.id, 
    required this.title,
    required this.album,
    required this.artist,
    required this.source,
    required this.image,
    required this.duration,
    // required this.favorite,
    // required this.counter,
    // required this.replay
  });

  factory Song.fromJson(Map<String, dynamic> map){
    return Song(
      id: map['id'],
      title: map['title'],
      album: map["album"],
      artist: map['artist'],
      source: map['source'],
      image: map['image'],
      duration: map['duration'],
      // favorite: map['favorite'],
      // counter: map['counter'],
      // replay: map['replay']
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) || 
    other is Song && runtimeType == other.runtimeType && id == other.id;
  }

  @override
  String toString() {
    // TODO: implement toString
    return "$id - $title";
  }
}