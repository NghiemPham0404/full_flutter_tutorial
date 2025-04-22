

import 'package:full_flutter_tutorial/music_player_project/data/source/source.dart';

import '../model/song.dart';

abstract interface class Repository {
  Future<List<Song>?> loadData();
}

class DefaultRepository implements Repository{

  final _localDataSource = LocalDataSource();
  final _remoteDataSource = RemoteDataSource();

  @override
  Future<List<Song>?> loadData() async {
    List<Song> songs = [];
    await _remoteDataSource.loadData().then((remoteData) async {
      if(remoteData == null){
        await _localDataSource.loadData().then((localData){
          if(localData!=null){
            songs.addAll(localData);
          }else{

          }
        });
        
      }else{
        songs.addAll(remoteData);
      }
    });
    return songs;
  }
}
