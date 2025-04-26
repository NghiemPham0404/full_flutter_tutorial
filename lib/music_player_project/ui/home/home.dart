import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_flutter_tutorial/music_player_project/data/model/song.dart';
import 'package:full_flutter_tutorial/music_player_project/ui/discovery/discovery.dart';
import 'package:full_flutter_tutorial/music_player_project/ui/home/viewmodel.dart';
import 'package:full_flutter_tutorial/music_player_project/ui/now_playing/playing.dart';
import 'package:full_flutter_tutorial/music_player_project/ui/settings/settings.dart';
import 'package:full_flutter_tutorial/music_player_project/ui/user/user.dart';

/**
 * our main app
 */
class MusicApp extends StatelessWidget{
  const MusicApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: "Music App",
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MusicHomePage(), // Todo : main page 
      debugShowCheckedModeBanner: false,
    );
  }
}

/**
 * main page or entry point of the app
 */
class MusicHomePage extends StatefulWidget{
  const MusicHomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MusicHomePageState();
  }
}

class _MusicHomePageState extends State<MusicHomePage>{

  // TODO : the home page have tabs
  final List<Widget> _tabs = [
    const HomeTab(),
    const DiscoveryTab(),
    const SettingsTab(),
    const UserTab(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: homepage main structure
    return CupertinoPageScaffold(
      // TODO: homepage navbar
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Music App"),
      ),
      // TODO: selectable tabs
      child: CupertinoTabScaffold(
        tabBuilder: (BuildContext context, int index){
          return _tabs[index];
        },
        // TODO: homepage tab bar or bottom navigation bar
        tabBar: CupertinoTabBar(
          backgroundColor: Theme.of(context).colorScheme.onInverseSurface,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.album), label: "Discovery"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "You"),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ) 
    );
  }
}

// home tab
class HomeTab extends StatelessWidget{

  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const HomeTabPage(),
      ),
    );
  }
}

/**
 * TODO : HomeTabPage contains contents of home tab
 */
class HomeTabPage extends StatefulWidget{
  const HomeTabPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeTabPageState();
  }
}

class _HomeTabPageState extends State<HomeTabPage>{

  List<Song> songs = [];
  late MusicAppViewModel _viewModel;

  @override
  void initState() {
    _viewModel = MusicAppViewModel();
    _viewModel.loadSong();
    observeData();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : getBody(),
    );
  }

  @override
  void dispose(){
    _viewModel.songStream.close();
    super.dispose();
  }

  Widget getBody(){
    bool showLoading = songs.isEmpty;
    if(showLoading){
      return getProgressBar();
    }else{
      return getListView();
    }
  }

  void observeData(){
    _viewModel.songStream.stream.listen((songList){
      setState(() {
        songs.addAll(songList);
      });
    });
  }
  
  Widget getProgressBar() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  
  Widget getListView() {
    return ListView.separated(
      itemBuilder: (context, position){
        return getRow(position);
      }, 
      separatorBuilder: (context, index){
        return const Divider(
          color: Colors.grey,
          thickness: 1,
          indent: 24,
          endIndent: 24,
        );
      }, 
      itemCount: songs.length,
      shrinkWrap: true,);
  }
  
  Widget getRow(int index){
    return _SongItemSection(parent: this, song: songs[index]);
  } 

  void showBottomSheet(){
    showModalBottomSheet(context: context, 
      builder: (context){
        return ClipRRect(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
          child : Container(
              height: 400,
              color: Colors.white,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Modal Bottom Sheet"),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.pop(context);
                      }, 
                      child: Text("Close Bottom sheet")
                    ),
                  ],
                ),
              ),
          ),
        );
    });
  }

  void navigate(Song song){
    Navigator.push(context, 
      CupertinoPageRoute(builder: (context){
        return NowPlayingPage(
          songs : songs,
          playingSong: song,
        );
      })
    );
  }
}

/**
 * TODO : Song Item of a ListView of songs
 */
class _SongItemSection extends StatelessWidget{
  final _HomeTabPageState parent;
  final Song song;

  const _SongItemSection({required this.parent, required this.song});
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 24, right: 24),
      leading: ClipRRect(
        borderRadius : BorderRadius.circular(8), 
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/images/my_logo.png', 
          image: song.image,
          width: 48,
          height: 48,
          imageErrorBuilder: (context, error, stackTrace){
            return Image.asset(
              'assets/images/my_logo.png',
              width: 48,
              height: 48,
            );
          },
        ),
      ),
      title: Text(song.title),
      subtitle: Text(song.artist),
      trailing: IconButton(
        icon: Icon(Icons.more_horiz),
        onPressed: (){
          parent.showBottomSheet();
        },
      ),
      onTap: (){ // onclick listener
        parent.navigate(song);
      },
    );
  }


}