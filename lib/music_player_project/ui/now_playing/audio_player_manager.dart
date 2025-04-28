import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class DurationState{

  const DurationState({
    required this.progress,
    required this.buffered,
    this.total,
  });


  final Duration progress;
  final Duration buffered;
  final Duration? total;
}

class AudioPlayerManager{
  factory AudioPlayerManager() => _instance;

  AudioPlayerManager.internal();
  static final AudioPlayerManager _instance = AudioPlayerManager.internal();


  final player = AudioPlayer();
  Stream<DurationState>? durationState;
  String songUrl = "";

  void prepare({isNewSong = false}){
    durationState = Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
      player.positionStream, 
      player.playbackEventStream, 
      (position, playbackEvent) => 
      DurationState(progress: position, 
        buffered: playbackEvent.bufferedPosition, 
        total: playbackEvent.duration)
    );
    if(isNewSong){
      player.setUrl(songUrl);
    }
  }

  void updateSongUrl(String link){
    songUrl = link;
  }


  void dispose(){
    player.dispose();
  }
}