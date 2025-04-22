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

class MyWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max, //configure the size of Row : max - match parent, min - wrap children
      mainAxisAlignment: MainAxisAlignment.spaceEvenly, //center, top, bottom, space between, space around, space evenly
      crossAxisAlignment: CrossAxisAlignment.center, // center, end, start
      spacing: 12,
      children: [ // children . if the total size of children is bigger than screen, it throw exception
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red[600],
          ),
          onPressed: (){}, 
          child: Text("button 1", style: TextStyle(fontSize: 20, color: Colors.white),)
        ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red[600],
            side :BorderSide(width : 1, color: Colors.red)
          ),
          onPressed: (){}, 
          child: Text("button 2", style: TextStyle(fontSize: 20),)
        ),
        TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.red[600],
          ),
          onPressed: (){}, 
          child: Text("button 3", style: TextStyle(fontSize: 20),)
        )
      ],
    );
  }
}