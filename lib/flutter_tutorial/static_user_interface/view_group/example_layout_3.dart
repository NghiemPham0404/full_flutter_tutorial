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

class MyWidget extends StatelessWidget {

  MyWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.pink, Colors.blueAccent])
        ),
        child: SizedBox(
          height: 100,
          child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: 1,
                color: Colors.transparent
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/my_logo.png"),
                      fit:BoxFit.cover
                    ),
                    shape: BoxShape.circle
                    ) 
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Music Song #1", style: TextStyle(color: Colors.grey[600], fontFamily: "SFPro"),),
                    Text("Nghiem Pham", style: TextStyle(color: Colors.grey[400], fontFamily: "SFPro"),),
                  ],
                ),
                TextButton.icon(
                    onPressed: (){}, 
                    label: Text(""), 
                    icon: Icon(
                      Icons.play_arrow, color: Colors.white,size: 32,)
                ),
                Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.favorite, color: Colors.white, size: 32,),
                      Text("23", 
                      style: TextStyle(color: Colors.white
                      , fontFamily: "SFPro"),)
                  ],
                )
              ],
            ),
          ),
        ),
    );
  }
}
