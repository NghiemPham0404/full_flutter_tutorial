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
    return Container(
      // child : Row(
      child : Column(
        children: [
          Expanded(
            flex : 1,
            child: Container(
              color: Colors.green,
              height: 150,             
            )
          ),
           Expanded(
            flex : 2,
            child: Container(
              color: Colors.red,
              height: 150,             
            )
          ),
          Expanded(
            flex : 1,
            child: Container(
              color: Colors.blue,
              height: 150,             
            )
          ),
        ],
      )
    );
  }
}