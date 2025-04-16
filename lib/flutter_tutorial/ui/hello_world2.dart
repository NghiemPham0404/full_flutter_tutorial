import 'package:flutter/material.dart';

/// Learn about SafeArea, Scaffold, AppBar, Center, Text
///
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text("Hello world",
              style: TextStyle(
                color: Colors.white
              ),
            ),
          ),
          body: const SafeArea(
              child: Center(child: Text("Hello world")
              )
           ),
        ),
          debugShowCheckedModeBanner: false,
    );
  }
}