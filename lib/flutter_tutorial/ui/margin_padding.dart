import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: 
            MyWidget(),
        )
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// use Padding Widget to configure a Widget padding by adding Padding widget as a child of the widget
class MyWidget extends StatelessWidget{
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Card(
      color : Colors.pink,
      margin: EdgeInsets.all(5), // use to spacing between itself and other components, the same way
                                // as padding
      child: Padding(
        // padding: EdgeInsets.all(5), // all from top, bottom, right, left
        //padding: EdgeInsets.fromLTRB(10, 5, 10, 5), // padding from 4 edges
        //padding: EdgeInsets.only(top: 10), // only from some of the edges
        //padding: EdgeInsets.symmetric(vertical: 10) // only top and bottom
        padding: EdgeInsets.symmetric(horizontal: 10), // only left and right
        child: Text(
        "Nghiem Pham", 
        style: TextStyle(
          fontSize: 24, 
          color: Colors.white
          ),
        ),  
      ),
    );
  }
  
}