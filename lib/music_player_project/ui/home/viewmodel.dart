import 'dart:async';

import 'package:full_flutter_tutorial/music_player_project/data/model/song.dart';
import 'package:full_flutter_tutorial/music_player_project/data/repository/repository.dart';

class MusicAppViewModel{
  StreamController<List<Song>> songStream = StreamController();

  void loadSong(){
    final repository = DefaultRepository();
    repository.loadData().then((data)=> songStream.add(data!)
    );
  }
}