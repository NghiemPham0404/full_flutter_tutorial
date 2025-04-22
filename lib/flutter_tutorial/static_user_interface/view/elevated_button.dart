import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          // body: MyWidget(),
          body: GradientButton(),
        )
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

// text
// color
// click
// padding
// margin

// shape
// shadow
// border
// icon
// disable

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  // TODO : return the Elevated Button
  @override
  Widget build(BuildContext context) {
    return 
    Container( 
      margin: EdgeInsets.all(5), // margin
      child: ElevatedButton.icon(
        onPressed: onClick, // clickable (enable)
        //onPressed : null,
        style: TextButton.styleFrom( // color
          padding: EdgeInsets.all(5), // padding
          foregroundColor: Colors.white,
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder( 
            borderRadius: BorderRadius.circular(10), 
          ),
          elevation: 3, // shadow
          shadowColor: Colors.greenAccent[500], // shadow color
          ),
        icon : Icon(Icons.add, size : 24),   
        label: Text( // if used icon, user label, otherwise just use child
          "Click me", // text
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  void onClick(){
    print("Click");
  }
}

class GradientButton extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return 
    Container( 
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.pink, Colors.amber]
          ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(50),
      ),
      margin: EdgeInsets.all(5), // margin
      child: ElevatedButton.icon(
        onPressed: onClick, // clickable (enable)
        //onPressed : null,
        style: TextButton.styleFrom( // color
          padding: EdgeInsets.all(5), // padding
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent
          ),
        icon : Icon(Icons.add, size : 24),   
        label: Text( // if used icon, user label, otherwise just use child
          "Click me", // text
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  void onClick(){
    print("Click");
  }
} 