import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_flutter_tutorial/music_player_project/data/model/song.dart';
import 'package:full_flutter_tutorial/music_player_project/ui/now_playing/audio_player_manager.dart';
import 'package:just_audio/just_audio.dart';

class NowPlaying extends StatelessWidget {
  final Song playingSong;
  final List<Song> songs;

  const NowPlaying({super.key, required this.playingSong, required this.songs});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// TODO : now playing page
class NowPlayingPage extends StatefulWidget {
  final Song playingSong;
  final List<Song> songs;

  const NowPlayingPage({super.key, required this.playingSong, required this.songs});


  @override
  State<NowPlayingPage> createState() => _NowPlayingPagetState();
}

// TODO : now playing page state
class _NowPlayingPagetState extends State<NowPlayingPage> with SingleTickerProviderStateMixin{
  late Song song;
  late List<Song> _currentSongs;
  late int _selectedSongIndex;
  late AnimationController _imageAnimController;
  late AudioPlayerManager audioPlayerManager;
  late bool _shuffling;
  late LoopMode _loopMode;

  @override
  void initState() {
    super.initState();
    song = widget.playingSong;
    _currentSongs = List.from(widget.songs);
    _selectedSongIndex = _currentSongs.indexOf(song);
    _imageAnimController = AnimationController(vsync: this, duration: const Duration(seconds: 12));
    audioPlayerManager = AudioPlayerManager();
    if(audioPlayerManager.songUrl.compareTo(song.source)!=0){
      audioPlayerManager.updateSongUrl(song.source);
      audioPlayerManager.prepare(isNewSong : true);
    } else{
      audioPlayerManager.prepare();
    }
    _shuffling = false;
    _loopMode = LoopMode.off;
  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;
    const delta = 64;
    final discWidth = screenWidth - delta;
    final radius = (discWidth) /2;

    return CupertinoPageScaffold(
      //Todo : navigation bar 
      navigationBar: CupertinoNavigationBar( 
        middle: Text("Now playing"),
        trailing: IconButton(
          onPressed: (){}, 
          icon: Icon(Icons.more_horiz)),
      ),
      // Todo : main content of page
      child: Scaffold(
        body: Center(                        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(song.album),
              const SizedBox(height : 16),
              const Text('_ ___ _'),
              const SizedBox(height : 48),
              RotationTransition( // TODO : Disc
              
                turns: Tween(begin: 0.0, end : 1.0).animate(_imageAnimController),
                child : ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/my_logo.png", 
                    image: song.image,
                    width: discWidth,
                    imageErrorBuilder: (context, error, stackTrace){
                      return Image.asset(
                        "assets/images/my_logo.png"
                      );
                    },
                  ),
                )
              ),
              Padding( // TODO : info, share, favor
                padding : EdgeInsets.only(top : 64, bottom : 16),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(icon: Icon(Icons.share), color: Theme.of(context).primaryColor ,onPressed: (){},),
                      Column(
                        children: [
                          Text(song.title, style: TextStyle(color: Colors.black, fontFamily: "SFPro"),),
                          Text(song.artist, style: TextStyle(color: Colors.grey, fontFamily: "SFPro"),),
                        ],
                      ),
                      IconButton(icon: Icon(Icons.favorite_border) , color: Theme.of(context).primaryColor, onPressed: (){},),
                    ],
                  ),
                ),
              ),
              Padding( // TODO : seekbar
                padding: EdgeInsets.only(top: 32, left: 24, right: 24, bottom: 16),
                child: _progessBar(),
              ),
              Padding( // TODO : Controller buttons
                padding: EdgeInsets.only(
                  top:32,
                  left : 24,
                  right : 24,
                  bottom: 16,
                ), 
                child: _mediaButtons(),
              ),
            ],
          )
        ),
      ),
    );
  }

  @override
  void dispose() {
    _imageAnimController.dispose();
    super.dispose();
  }

  StreamBuilder<DurationState> _progessBar(){
    return StreamBuilder<DurationState>(
      stream: audioPlayerManager.durationState, 
      builder: (context, snapShot){
        final durationState = snapShot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          onSeek: (duration) => audioPlayerManager.player.seek(duration),
          progress: progress, 
          buffered: buffered, 
          total: total,
          barHeight: 5.0,
          barCapShape: BarCapShape.round,
          baseBarColor: Colors.grey.withAlpha(90),
          bufferedBarColor: Colors.grey,
          progressBarColor: Colors.deepPurpleAccent,
          thumbColor: Colors.deepPurple,
          thumbGlowColor: Colors.deepPurpleAccent,
        );
      }
    );
  }

  Widget _mediaButtons(){
    return SizedBox( 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MediaButtonControl(function: _setShuffle, icon: Icons.shuffle, color: _getShuffleColor(), size: 24),
          MediaButtonControl(function: playPrevious, icon: Icons.skip_previous_rounded, color: Colors.deepPurple, size: 36),
          _playButton(),
          MediaButtonControl(function: playNext, icon: Icons.skip_next_rounded, color: Colors.deepPurple, size: 36),
          MediaButtonControl(function: _setRepeat, icon: _getRepeatButton(), color: _getRepeatColor(), size: 24),
        ],
      ),
    );
  }

  StreamBuilder<PlayerState> _playButton(){
    return StreamBuilder<PlayerState>(
      stream: audioPlayerManager.player.playerStateStream, 
      builder: (context, snapShot){
        final playerState = snapShot.data;
        final playing = playerState?.playing;
        final processingState = playerState?.processingState;
        if (processingState == ProcessingState.loading
        || processingState == ProcessingState.buffering){
          return CircularProgressIndicator(color: Colors.deepPurple);
        }else if (processingState == ProcessingState.completed){
          _imageAnimController.stop();
          _handleSongCompleted();
          return MediaButtonControl(
            function: (){
              playAgain();
            }, 
            icon:  Icons.replay,
            color: Colors.deepPurple, 
            size: 48,
          );
        }else if (playing != true){
          return MediaButtonControl(
            function: (){
              audioPlayerManager.player.play();
            }, 
            icon:  Icons.play_arrow_rounded,
            color: Colors.deepPurple, 
            size: 48,
          );
        }else{
          _imageAnimController.repeat();
          return MediaButtonControl(
            function: (){
              audioPlayerManager.player.pause();
              _imageAnimController.stop();  
            }, 
            icon:  Icons.pause,
            color: Colors.deepPurple, 
            size: 48,
          );
        }
      }
    );
  }

  void playNext(){
    setState(() {
      if(_selectedSongIndex < _currentSongs.length - 1){
        song = _currentSongs[++_selectedSongIndex]; 
      }else{
        _selectedSongIndex = 0;
        song = _currentSongs[_selectedSongIndex];
      }
      _loopMode = LoopMode.off;
    });
    _imageAnimController.reset();
    audioPlayerManager.updateSongUrl(song.source);
    audioPlayerManager.prepare(isNewSong : true);
  }

  void playPrevious(){
    setState(() {
      if(_selectedSongIndex > 0){
        song = _currentSongs[--_selectedSongIndex];
      }else{
        _selectedSongIndex = _currentSongs.length-1;
        song = _currentSongs[_selectedSongIndex];
      }
      _loopMode = LoopMode.off;
    });
    _imageAnimController.reset();
    audioPlayerManager.updateSongUrl(song.source);
    audioPlayerManager.prepare(isNewSong : true);
  }
  
  void playAgain(){
    audioPlayerManager.player.seek(Duration.zero);
    _imageAnimController.reset();
  }

  void _setShuffle(){
   setState(() {
     _shuffling = !_shuffling;
   });
   if(_shuffling){
      _currentSongs.shuffle();
    }else{
      _currentSongs = List.from(widget.songs);
    }
    _selectedSongIndex = _currentSongs.indexOf(song);
  }

  Color _getShuffleColor(){
    return _shuffling ? Colors.deepPurple : Colors.grey;
  }

  void _setRepeat(){
    setState(() {
      _loopMode = switch(_loopMode){
        LoopMode.off => LoopMode.one,
        LoopMode.one => LoopMode.all,
        LoopMode.all => LoopMode.off,
      };
    });
  }

  Color _getRepeatColor(){
    return _loopMode!=LoopMode.off ? Colors.deepPurple : Colors.grey;
  }

  IconData _getRepeatButton(){
    return switch(_loopMode){
        LoopMode.off => Icons.repeat,
        LoopMode.one => Icons.repeat_one,
        LoopMode.all => Icons.repeat_on,
        // ignore: unreachable_switch_case
        _ => Icons.repeat
    };
  }

  void _handleSongCompleted() {
    switch (_loopMode) {
      case LoopMode.off:
        Future.delayed(const Duration(seconds: 5), () {
          playNext();
        });
        break;

      case LoopMode.one:
        _loopMode = LoopMode.off;
        Future.delayed(const Duration(seconds: 3), () {
          playAgain();
        });
        return;

      case LoopMode.all:
        Future.delayed(const Duration(seconds: 3), () {
          playAgain();
        });
        break;
    }
  }
}

class MediaButtonControl extends StatefulWidget{

  final void Function()? function;
  final IconData icon;
  final Color? color;
  final double? size;

  const MediaButtonControl(
    {
      super.key, 
      required this.function,
      required this.icon,
      required this.color,
      required this.size,
    }
  );
  
  @override
  State<StatefulWidget> createState() => _MediaButtonControlState();
}

class _MediaButtonControlState extends State<MediaButtonControl>{
  
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.function, 
      icon: Icon(widget.icon), 
      color: widget.color ?? Theme.of(context).colorScheme.primary,
      iconSize: widget.size, 
    );
  }
}


