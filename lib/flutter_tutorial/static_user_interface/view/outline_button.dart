import "package:flutter/material.dart";

void main() {
  runApp(
    MaterialApp(
      home: SafeArea(
        child: Scaffold(
          // body: MyWidget(),
          body: GradientOutlineButton(),
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

  // TODO : return the Text Button
  @override
  Widget build(BuildContext context) {
    return 
    Container( 
      margin: EdgeInsets.all(5), // margin
      child: OutlinedButton.icon(
        onPressed: onClick, // clickable (enable) , change to null if want the button to be disable (unclickable)
        //onPressed : null,
        style: TextButton.styleFrom( // color
          padding: EdgeInsets.all(5), // padding
          foregroundColor: Colors.pink,
          side : BorderSide(width: 1, color: Colors.pink)
          ),
        icon : Icon(Icons.add, size : 24),   
        label: Text( // if used icon, user label, otherwise just use child
          "Click me", // text
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  void onClick(){
    print("Click");
  }
}

class GradientOutlineButton extends StatelessWidget{

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
      padding: EdgeInsets.all(2),
        child: TextButton.icon(
          onPressed: onClick, // clickable (enable)
          //onPressed : null,
          style: OutlinedButton.styleFrom( // color
            padding: EdgeInsets.all(5), // padding
            foregroundColor: Colors.pink,
            backgroundColor:Colors.white
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