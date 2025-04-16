// TODO : step 1 - import lib
import 'package:flutter/material.dart';

// TODO : step 2 - delare app
class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: Scaffold(body: Text("Hello world"),)
    );
  }
}
// TODO : step 3 - main
void main(){
  // TODO : step 4 - run app
  runApp(MyApp());
}

