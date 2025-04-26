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

class NowPlayingPage extends StatefulWidget {
  final Song playingSong;
  final List<Song> songs;

  const NowPlayingPage({super.key, required this.playingSong, required this.songs});


  @override
  State<NowPlayingPage> createState() => _NowPlayingPagetState();
}

class _NowPlayingPagetState extends State<NowPlayingPage> with SingleTickerProviderStateMixin{
  late Song song;
  late AnimationController _imageAnimController;
  late AudioPlayerManager audioPlayerManager;

  @override
  void initState() {
    super.initState();
    song = widget.playingSong;
    _imageAnimController = AnimationController(vsync: this, duration: const Duration(seconds: 12));
    audioPlayerManager = AudioPlayerManager(songUrl: song.source);
    audioPlayerManager.init();
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
              RotationTransition(
              
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
              Padding(
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
              Padding(
                padding: EdgeInsets.only(top: 32, left: 24, right: 24, bottom: 16),
                child: _progessBar(),
              ),
              Padding(
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
    audioPlayerManager.player.dispose();
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
          total: total,);
      }
    );
  }

  Widget _mediaButtons(){
    return SizedBox( 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MediaButtonControl(function: (){}, icon: Icons.shuffle, color: Colors.deepPurple, size: 24),
          MediaButtonControl(function: (){}, icon: Icons.skip_previous_rounded, color: Colors.deepPurple, size: 36),
          _playButton(),
          MediaButtonControl(function: (){}, icon: Icons.skip_next_rounded, color: Colors.deepPurple, size: 36),
          MediaButtonControl(function: (){}, icon: Icons.repeat, color: Colors.deepPurple, size: 24),
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
          return MediaButtonControl(
            function: (){
              audioPlayerManager.player.seek(Duration.zero);
              _imageAnimController.repeat();
            }, 
            icon:  Icons.replay,
            color: Colors.deepPurple, 
            size: 48,
          );
        }else if (playing == false){
          _imageAnimController.stop();
          return MediaButtonControl(
            function: (){
              audioPlayerManager.player.play();
              _imageAnimController.repeat();
            }, 
            icon:  Icons.play_arrow_rounded,
            color: Colors.deepPurple, 
            size: 48,
          );
        }
        else{
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


