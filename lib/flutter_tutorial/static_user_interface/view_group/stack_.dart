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
// Align, Positioned
class MyWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return
          Container(
            color : Colors.grey,
            width: 500,
            height: 500,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(color: Colors.red, width: 300, height: 300,),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Container(color: Colors.green, width: 200, height: 200,)
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(color: Colors.blue, width: 100, height: 100,)
                ),
                Container(color: Colors.yellow, width: 70, height: 70,),
                Container(color: Colors.blue, width: 60, height: 60,),
              ],
            ),
          );
  }
  
}