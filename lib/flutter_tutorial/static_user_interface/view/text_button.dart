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
      child: TextButton.icon(
        onPressed: onClick, // clickable (enable) , change to null if want the button to be disable (unclickable)
        //onPressed : null,
        style: TextButton.styleFrom( // color
          padding: EdgeInsets.all(5), // padding
          foregroundColor: Colors.pink,
          // backgroundColor: Colors.green, // shouldnt be used in text button, use on Elevated button instead
          // shape: RoundedRectangleBorder( // shouldnt be used in text button,
          //   borderRadius: BorderRadius.circular(10), 
          // ),
          // elevation: 2, // shadow // shouldnt be used in text button,
          // shadowColor: Colors.pink[900] // shadow color // shouldnt be used in text button,
          // side : BorderSide(width: 2, color: Colors.pink) //border // shouldnt be used in text button,
          ),
        icon : Icon(Icons.add, size : 24),   
        label: Text( // if used icon, user label, otherwise just use child
          "Click me", // text
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }

  void onClick(){
    print("Click");
  }
}