import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_flutter_tutorial/music_player_project/data/model/song.dart';
import 'package:full_flutter_tutorial/music_player_project/ui/discovery/discovery.dart';
import 'package:full_flutter_tutorial/music_player_project/ui/home/viewmodel.dart';
import 'package:full_flutter_tutorial/music_player_project/ui/settings/settings.dart';
import 'package:full_flutter_tutorial/music_player_project/ui/user/user.dart';

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
      home: MusicHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MusicHomePage extends StatefulWidget{
  const MusicHomePage({super.key});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MusicHomePageState();
  }
}

class _MusicHomePageState extends State<MusicHomePage>{

  final List<Widget> _tabs = [
    const HomeTab(),
    const DiscoveryTab(),
    const SettingsTab(),
    const UserTab(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text("Music App"),
      ),
      child: CupertinoTabScaffold(
        tabBuilder: (BuildContext context, int index){
          return _tabs[index];
        },
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

class HomeTabPage extends StatefulWidget{
  const HomeTabPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeTabPageState();
  }
}

class HomeTabPageState extends State<HomeTabPage>{

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
    return Text(songs[index].title);
  }
  
}