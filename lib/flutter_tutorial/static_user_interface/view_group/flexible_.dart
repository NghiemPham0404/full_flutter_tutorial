import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold( 
          body: MyWidget(),
        )
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// Flexible working like the expanded, however, flexible components can be resized loosely
class MyWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return
      Column(
        children: [
          Flexible(
            fit: FlexFit.loose,
            flex: 1,
            child: Container(color: Colors.red,)
          ),
           Flexible(
            flex: 2,
            fit: FlexFit.loose, // loose allow to set size of the widget despite using Flex
            child: Container(color: Colors.yellow, height: 150,)
          ),
           Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Container(color: Colors.black,)
          ),
        ],
      );
  }
  
}